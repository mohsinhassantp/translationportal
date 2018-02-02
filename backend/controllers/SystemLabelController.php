<?php

namespace backend\controllers;

use backend\models\ScreenWindow;
use backend\models\Translation;
use backend\models\Types;
use Yii;
use backend\models\SystemLabel;
use backend\models\SearchSystemLabel;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\filters\AccessControl;
use common\components\AccessRule;
use common\models\User;

/**
 * SystemLabelController implements the CRUD actions for SystemLabel model.
 */
class SystemLabelController extends Controller
{
    /**
     * @inheritdoc
     */
    /*public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }*/

    // default function for Yii
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
            'access' => [
                'class' => AccessControl::className(),
                // We will override the default rule config with the new AccessRule class
                'ruleConfig' => [
                    'class' => AccessRule::className(),
                ],
                'only' => ['index', 'create', 'update', 'delete'],
                'rules' => [
                    [
                        'actions' => ['index'],//'createTranslation'
                        'allow' => true,
                        // Allow users, moderators and admins to create
                        'roles' => [
                            /*User::STATUS_ACTIVE,*/
                            User::ROLE_MODERATOR,
                            User::ROLE_ADMIN
                        ],
                    ],
                    [
                        'actions' => ['create', 'update', 'delete'],
                        'allow' => true,
                        // Allow admins to delete
                        'roles' => [
                            User::ROLE_ADMIN
                        ],
                    ],
                ],
            ],
            /*'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'users' => ['mohsin'],
                    ],
                ],
            ],*/
        ];
    }

    /**
     * Lists all SystemLabel models.
     * @return mixed
     */
    public function actionIndex()
    {
        //getting data from database
        $searchModel = new SearchSystemLabel();

        //processing search data
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        // checking logged in user role to use view file
        if (\Yii::$app->user->identity->isAdmin) {
            //showing list view
            return $this->render('index', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
        } else {
            return $this->render('index_translator', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
        }
    }

    /**
     * Displays a single SystemLabel model.
     * @param string $id
     * @return mixed
     */
    public function actionView($id)
    {
        //getting perticular record
        $model = $this->findModel($id);

        //fetching data from screen_windows to get types string value
        $window = ScreenWindow::find()
            ->where(['window_id' => $model->window_id])
            ->one();

        //fetching data from types to get types string value
        $typeData = Types::find()
            ->where(['type_id' => $window['type_id']])
            ->one();

        //setting perticular type name
        $type = $typeData['type_name'];

        //fetching all screenshots images
        $screenshotData = (new \yii\db\Query())
            ->select('*')
            ->from('screenshots')
            ->where(['window_id' => $model->window_id])
            ->all();

        //fetching all translation date
        $translationData = (new \yii\db\Query())
            ->select(['*'])
            ->from('translation AS t')
            ->innerJoin('user u', 't.created_by = u.id')
            ->where(["t.label_id" => $id, "t.language_id" => \Yii::$app->session->get('languageId')])
            ->orderBy(['(t.is_approved)' => SORT_DESC])
            ->all();

        //view form
        return $this->render('view', [
            'model' => $model,
            'type' => $type,
            'translationData' => $translationData,
            'screenshotData' => $screenshotData
        ]);
    }

    /**
     * Creates a new SystemLabel model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        //create new instance
        $model = new SystemLabel();

        //check if form submitted then validate, save and redirect
        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            //showing success message and redirect
            \Yii::$app->getSession()->setFlash('success', 'System-label created successfully.');
            return $this->redirect(['index']);
            //return $this->redirect(['view', 'id' => $model->label_id]);

        } else {
            //if form was not submit set screen-window data and show input form
            $screenWindow = ArrayHelper::map(ScreenWindow::find()->all(), 'window_id', 'window_name');

            return $this->render('create', [
                'model' => $model,
                'screenWindow' => $screenWindow,
            ]);
        }
    }

    /**
     * Updates an existing SystemLabel model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        //create new instance
        $model = $this->findModel($id);

        //check if form submitted then validate, save and redirect
        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            //showing success message and redirect
            \Yii::$app->getSession()->setFlash('success', 'System-label updated successfully.');
            //return $this->redirect(['view', 'id' => $model->label_id]);
            return $this->redirect('index');
        } else {

            //if form is not submitted set screen-window data and show input form
            $screenWindow = ArrayHelper::map(ScreenWindow::find()->all(), 'window_id', 'window_name');

            //fetching screenshots
            $screenshotData = (new \yii\db\Query())
                ->select('*')
                ->from('screenshots')
                ->where(['window_id' => $model->window_id])
                ->all();

            //sending all data to view
            return $this->render('update', [
                'model' => $model,
                'screenWindow' => $screenWindow,
                'screenshotData' => $screenshotData,
            ]);
        }
    }

    /**
     * Deletes an existing SystemLabel model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {

        //fetching translation those are related with this system label
        $translation = \backend\models\Translation::findOne(['label_id' => $id]); //->where->one();

        //checking either translation found related to this system label
        if (empty($translation)) {

            //getting record from database and delete
            $this->findModel($id)->delete();

            //showing success message and redirect to list page
            \Yii::$app->getSession()->setFlash('success', 'System-label removed successfully.');
        } else {
            //showing success message and redirect to list page
            \Yii::$app->getSession()->setFlash('error', 'There are Translation available for this, Delete them first please');
        }

        return $this->redirect(['index']);
    }

    /*
     * Function to redirect add translation page*/
    public function actionCreateTranslation($id)
    {
        //create translation from system label redirct to function
        return $this->redirect(['translation/createwithlabel', 'id' => $id]);
    }

    /**
     * Finds the SystemLabel model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return SystemLabel the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        //getting model if not available throw exception
        if (($model = SystemLabel::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /* This function creates new translation .string file for IOS as per the language */
    public function actionGenerateTranslateIos()
    {
        $languageId = intval($_GET['id']);

        //generating file details
        $filePath = '/uploads/csv/' . 'translation_ios_' . $languageId . '.txt';
        $file = dirname(dirname(__FILE__)) . $filePath;


        // Open the file to get existing content
        $current = "";

        //check and validate language
        //\Yii::$app->session->get('languageId');
        if (intval($languageId) == 0) {
            $languageId = 1;
        }

        //query to fetch required data from database
        $labelData = (new \yii\db\Query())
            ->select('*')
            ->from('system_labels')
            ->leftJoin('translation', '`translation`.`label_id` = `system_labels`.`label_id`')
            ->Where(['not', ['access_key_ios' => '']])
            ->andWhere('`translation`.`is_approved` = 1')
            ->andWhere('`translation`.`language_id` =' . $languageId)
            ->all();

        //make preparation to put contents into the file
        foreach ($labelData as $label) {
            $current .= $label['access_key_ios'] . ' = "' . $label['translation'] . '";-n-r-';
        }

        //writing content into file
        file_put_contents($file, $current); //, FILE_APPEND | LOCK_EX

        //setup message and redirecting
        \Yii::$app->getSession()->setFlash('success', 'Translation file for IOS is generated successfully.<a href="' . str_replace("?", "/", $_SERVER['REQUEST_URI']) . "../../../../.." . $filePath . '" target="_blank">Open File </a>');
        return $this->redirect(['language/index']);
    }

    /* This function creates new translation .xml file for Android as per the language */
    public function actionGenerateTranslateAndroid()
    {
        //getting language id
        $languageId = $_GET['id'];

        //generating file details
        $filePath = '/uploads/csv/' . 'translation_android_' . $languageId . '.xml';
        $file = dirname(dirname(__FILE__)) . $filePath;

        //generating file contents
        $current = "<?xml version=\"1.0\" encoding=\"utf-8\"?>-n-r-<resources>-n-r-";

        //validate language id
        if (intval($languageId) == 0) {
            $languageId = 1;
        }

        //query to fetch required data from database
        $labelData = (new \yii\db\Query())
            ->select('*')
            ->from('system_labels')
            ->leftJoin('translation', '`translation`.`label_id` = `system_labels`.`label_id`')
            ->Where(['not', ['access_key_android' => '']])
            ->andWhere('`translation`.`is_approved` = 1')
            ->andWhere('`translation`.`language_id` = ' . $languageId)
            ->all();

        //make preparation to put contents into the file
        foreach ($labelData as $label) {
            $current .= '    <string name="' . $label['access_key_android'] . '">' . $label['translation'] . '</string>-n-r-';
        }
        $current .= '</resources>';

        //writing content into file
        file_put_contents($file, $current); //, FILE_APPEND | LOCK_EX

        //setup message and redirecting
        \Yii::$app->getSession()->setFlash('success', 'Translation file for Android is generated successfully.<a href="' . str_replace("?", "/", $_SERVER['REQUEST_URI']) . "../../../../.." . $filePath . '" target="_blank">Open File </a>');
        return $this->redirect(['language/index']);
    }

    /* This function creates new labels file for IOS */
    protected function actionGenerateLabelIos()
    {
        //generating file details
        $file = $_SERVER['DOCUMENT_ROOT'] . '/tp/backend/uploads/csv/' . 'ios_translation.txt';

        //
        $current = "/*
                  Localizable.strings
                  flexiroamx
                
                  Created by Flexiroam iMac 1 on 15/12/2016.
                  Copyright © 2016 Flexiroam. All rights reserved.
                */-n-r-";

        //query to fetch required data from database
        $labelData = (new \yii\db\Query())
            ->select('*')
            ->from('system_labels')
            ->Where(['not', ['access_key_ios' => null]])
            ->all();

        // preparation to put contents into the file
        foreach ($labelData as $label) {

            $current .= $label['access_key_ios'] . ' = "' . $label['label'] . '"-n-r-';
        }
        //writing content into file
        file_put_contents($file, $current); //, FILE_APPEND | LOCK_EXs
    }

    /* This function creates new labels file for IOS */
    protected function actionGenerateLabelAndroid()
    {
        //generating file details
        $file = $_SERVER['DOCUMENT_ROOT'] . '/tp/backend/uploads/csv/' . 'news3.xml';
        // Open the file to get existing content

        $current = "<resources>-r-n";

        //query to fetch required data from database
        $labelData = (new \yii\db\Query())
            ->select('*')
            ->from('system_labels')
            ->Where(['not', ['access_key_android' => null]])
            ->all();

        // preparation to put contents into the file
        foreach ($labelData as $label) {

            $translatable = '';
            if ($label['translatable'] == 0) {
                $translatable = ' translatable="false"';
            }
            $current .= '    <string name="' . $label['access_key_android'] . '"' . $translatable . '>' . htmlentities($label['label']) . '</string>-r-n';
        }
        $current .= '</resources>';

        //writing content into file
        file_put_contents($file, $current); //, FILE_APPEND | LOCK_EX
    }

    /* Function will populate existing .string file's translations, needs only once and will be removed so no need to commenting*/
    public function actionImportIosTranslation()
    {
        $file = "http://localhost/tp/backend/uploads/csv/ios_labels.txt";
        $fp = fopen($file, "r");
        while ($line = fgets($fp, 1000)) {
            $xplodArray = explode("=", str_replace(['"', ";"], "", $line));

            //echo "<pre>";
            // print_r($xplodArray[0]);// ."<br />";
            if (sizeof($xplodArray) > 1) {
                $labelData = SystemLabel::find()->where(["label" => trim($xplodArray[1])])->one();
                if (!empty($labelData['label_id'])) {
                    /*$labelData->access_key_ios = $xplodArray[0];
                    $labelData->save();*/
                    echo "<br />Not empty ";

                } else {
                    /*$model = new SystemLabel();
                    $model->window_id = 0;
                    $model->label = trim($xplodArray[1]);
                    $model->access_key_ios = $xplodArray[0];

                    $model->save();*/

                    echo "<br /> ### ";
                    //echo $xplodArray[0] . "<br />";
                }
            }
        }
        exit;
    }

    /* Function will populate existing labels file's label, needs only once and will be removed  so no need to commenting*/
    public function actionImportIosLabels()
    {
        $file = "http://localhost/tp/backend/uploads/csv/ios_labels.txt";
        $fp = fopen($file, "r");
        while ($line = fgets($fp, 1000)) {
            $xplodArray = explode("=", str_replace(['"', ";"], "", $line));

            //echo "<pre>";
            // print_r($xplodArray[0]);// ."<br />";
            if (sizeof($xplodArray) > 1) {
                $labelData = SystemLabel::find()->where(["label" => trim($xplodArray[1])])->one();
                if (!empty($labelData['label_id'])) {
                    /*$labelData->access_key_ios = $xplodArray[0];
                    $labelData->save();*/
                    echo "<br />Not empty ";

                } else {
                    /*$model = new SystemLabel();
                    $model->window_id = 0;
                    $model->label = trim($xplodArray[1]);
                    $model->access_key_ios = $xplodArray[0];

                    $model->save();*/

                    echo "<br /> ### ";
                    //echo $xplodArray[0] . "<br />";
                }
            }
        }
        exit;
    }

    /* Function will populate existing .xml file's label, needs only once and will be removed so no need to commenting */
    public function actionImportAndroidLabels()
    {

        $xmlStr = file_get_contents('http://localhost/tp/backend/uploads/csv/dummy_entry.xml');
        $xml = simplexml_load_string($xmlStr);

        //loop through the each node of molecule
        foreach ($xml->string as $record) {

            $arrXml = (array)$record;

            //echo "<pre>";print_r($arrXml);


            if (empty($arrXml[0]) && !empty($arrXml['b'])) {
                $arrXml[0] = "<b>" . $arrXml['b'] . "</b>";
            }
            /*echo $arrXml[0];
            exit;*/

            $labelData = SystemLabel::find()->where(["label" => $arrXml[0], "access_key_android" => $arrXml['@attributes']['name']])->one();
            if (empty($labelData['label'])) {
                $model = new SystemLabel();
                $model->window_id = 0;
                $model->label = $arrXml[0];
                $model->access_key_android = $arrXml['@attributes']['name'];
                if (sizeof($arrXml['@attributes']) == 1) {

                    echo $arrXml['@attributes']['name'] . "==" . $arrXml[0] . "(" . sizeof($arrXml['@attributes']) . ")<br>";
                } else {

                    $model->translatable = $arrXml['@attributes']['translatable'];
                    echo $arrXml['@attributes']['name'] . "==" . $arrXml['@attributes']['translatable'] . "==" . $arrXml[0] . "(" . sizeof($arrXml['@attributes']) . ")<br>";
                }
                $model->save();
            }
        }
    }

    /* Function will populate existing missin labels file's label, needs only once and will be removed so no need to commenting */
    public function actionImportIosMissingLabels()
    {
        $file = "http://localhost/tp/backend/uploads/csv/ios_cn_sim.txt";
        $fp = fopen($file, "r");
        while ($line = fgets($fp, 1000)) {
            $xplodArray = explode("=", str_replace(['"', ";"], "", $line));

            //echo "<pre>";
            // print_r($xplodArray[0]);// ."<br />";
            if (sizeof($xplodArray) > 1) {
                $labelData = SystemLabel::find()->where(["access_key_ios" => trim($xplodArray[0])])->one();
                if (!empty($labelData['label_id'])) {
                    $trans = Translation::find()->where(["label_id" => $labelData['label_id']])->one();
                    // echo "<pre>";print_r($trans);exit;
                    if (empty($trans['translation_id'])) {
                        echo $labelData['label'] . "==" . $labelData['access_key_ios'] . "==" . $xplodArray[0];
                    }
                    /*$labelData->access_key_ios = $xplodArray[0];
                    $labelData->save();*/
                    //echo "<br />Not empty ";

                } else {
                    /*$model = new SystemLabel();
                    $model->window_id = 0;
                    $model->label = trim($xplodArray[1]);
                    $model->access_key_ios = $xplodArray[0];

                    $model->save();*/

                    echo "<br />" . $xplodArray[0] . "== " . $xplodArray[1];
                    //echo $xplodArray[0] . "<br />";
                }
            }
        }
        exit;
    }
}
