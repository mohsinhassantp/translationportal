<?php

namespace backend\controllers;

use backend\models\Language;

//use backend\models\Screenshot;
//use backend\models\User;
use backend\models\SystemLabel;
use backend\models\ScreenWindow;
use backend\models\Types;
use Yii;
use backend\models\Translation;
use backend\models\SearchTranslation;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\filters\AccessControl;
use common\components\AccessRule;
use common\models\User;
use yii\web\UploadedFile;

//use yii\db;


/**
 * TranslationController implements the CRUD actions for Translation model.
 */
class TranslationController extends Controller
{
    /**
     * @inheritdoc
     */

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
                'only' => ['index', 'create', 'update', 'delete', 'toggle-approve', 'createwithlabel', 'create-window-label', 'approveall', 'disapproveall'],
                'rules' => [
                    [
                        'actions' => ['index', 'create', 'update', 'createwithlabel'],
                        'allow' => true,
                        // Allow users, moderators and admins to create
                        'roles' => [
                            User::ROLE_MODERATOR,
                            User::ROLE_ADMIN
                        ],
                    ],
                    [
                        'actions' => ['create-window-label'],
                        'allow' => true,
                        // Allow users, moderators and admins to create
                        'roles' => [
                            User::ROLE_MODERATOR,
                        ],
                    ],
                    [
                        'actions' => ['toggle-approve', 'delete', 'approvenotapprove', 'approveall', 'disapproveall'],
                        'allow' => true,
                        // Allow admins to delete
                        'roles' => [
                            User::ROLE_ADMIN
                        ],
                    ],
                ],
            ],
        ];
    }

    /**
     * Lists all Translation models.
     * @return mixed
     */
    public function actionIndex()
    {
        //check loggedin user role
        if (\Yii::$app->user->identity->isAdmin) {
            //setting data for list view
            $searchModel = new SearchTranslation();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            //showing list view page
            return $this->render('index', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);

        } else {
            //setting data for list view
            $searchModel = new SearchTranslation(['language_id' => \Yii::$app->session->get('languageId')]);
            //'sort'=> ['defaultOrder' => ['translation_id' => SORT_DESC]]
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);


            //showing list view page
            return $this->render('index_translator', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
        }

    }

    /**
     * Displays a single Translation model.
     * @param string $id
     * @return mixed
     */
    public function actionView($id)
    {
        //setting perticular data and redirect
        $model = $this->findModel($id);

        //fetching all screenshots images for view page
        $screenshotData = (new \yii\db\Query())
            ->select('*')
            ->from('screenshots')
            ->where(['window_id' => $model->label->window_id])
            ->all();

        return $this->render('view', [
            'model' => $model,
            'screenshotData' => $screenshotData,
        ]);
    }

    /**
     * Finds the Translation model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Translation the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        //getting model if not available throw exception
        if (($model = Translation::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /**
     * Creates a new Translation model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        //create new instance for translation
        $model = new Translation();

        //set logged in user as creator
        $model->created_by = Yii::$app->user->id;

        //check if form submitted validate and store data into database
//        if ($model->load(Yii::$app->request->post()) && $model->save()) {
        if ($model->load(Yii::$app->request->post())) {

            if (!\Yii::$app->user->identity->isAdmin) {
                $model->language_id = \Yii::$app->session->get('languageId');
            }

            $model->save();
            //showing success message and redirect
            \Yii::$app->getSession()->setFlash('success', 'Translation created successfully.');
            return $this->redirect('index');

        } else {
            if (\Yii::$app->user->identity->isAdmin) {
                //getting system-label
                $systemLabel = ArrayHelper::map(SystemLabel::find()->all(), 'label_id', 'label');

                //getting language data
                $languages = ArrayHelper::map(Language::find()->all(), 'language_id', 'language_name');
                /*$window = ArrayHelper::map(ScreenWindow::find()->all(), 'window_id', 'window_id');

                $type = ArrayHelper::map(Types::find()->all(), 'type_id', 'type_name');
                $screenshotData = ArrayHelper::map(Screenshot::find()->all(), 'screenshot_id', 'image');*/

            } else {
                //return $this->redirect(['createwithlabel', 'id' => $model->translation_id]);
                $systemLabel = ArrayHelper::map(SystemLabel::find()->all(), 'label_id', 'label');

                $model = new Translation(["language_id" => \Yii::$app->session->get('languageId')]);
                return $this->render('create_translator', [
                    'model' => $model,
                    'systemLabel' => $systemLabel,
                    /*'screenshotData' => $screenshotData,*/
                ]);

            }

            return $this->render('create', [
                'model' => $model,
                'systemLabel' => $systemLabel,
                'languages' => $languages,
            ]);
        }
    }

    /* public function actionForm()
     {
         $model = new \yii\base\DynamicModel([
             'name', 'email', 'address'
         ]);
         $model->addRule(['name','email'], 'required')
             ->addRule(['email'], 'email')
             ->addRule('address', 'string',['max'=>32]);

         if($model->load(Yii::$app->request->post())){
             echo "<pre>";print_r($_POST);
             exit;
             // do somenthing with model
             return $this->redirect(['view']);
         }
         return $this->render('create_window_label', ['model'=>$model]);
     }*/

    /**
     * Creates a new Translation model but with information of system label.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreatewithlabel($id)
    {
        //creating translation instance
        $model = new Translation();

        //check if form submitted
        if ($model->load(Yii::$app->request->post())) {

            //setting translation fields data and save into database
            $model->label_id = intval($id);
            $model->language_id = \Yii::$app->session->get('languageId');        // fetch language id from the logged in user data
            $model->is_approved = 0;
            $model->created_by = Yii::$app->user->id;
            $model->save();

            //showing success message and redirect
            \Yii::$app->getSession()->setFlash('success', 'Translation added successfully.'); //<a href="../translation/index">Goto Translation List</a>
            return $this->redirect(['system-label/index', 'id' => $model->translation_id]);
        } else {

            //if form is not submitted
            // getting system-label data

            $systemLabel = SystemLabel::findOne($id);

            //fetching data from screen_windows to get types string value
            $window = ScreenWindow::find()
                ->where(['window_id' => $systemLabel->window_id])
                ->one();

            //fetching data from types to get types string value
            $typeData = Types::find()
                ->where(['type_id' => $window['type_id']])
                ->one();

            //setting perticular type name for detail view
            $type = $typeData['type_name'];

            //fetching all screenshots images for view page
            $screenshotData = Yii::$app->db->createCommand('SELECT image,screenshot_id FROM screenshots where window_id = ' . $systemLabel->window_id)->queryAll();

            //getting system-labels data
            $labels = ArrayHelper::map(SystemLabel::find()->all(), 'label_id', 'label');

            //getting languages data
            $languages = ArrayHelper::map(Language::find()->all(), 'language_id', 'language_name');

            //showing input form
            return $this->render('createwithlabel', [
                'model' => $model,
                'labels' => $labels,
                'languages' => $languages,
                'systemLabel' => $systemLabel,
                'window' => $window,
                'type' => $type,
                'screenshotData' => $screenshotData,
            ]);
        }
    }

    /*function to make toggle impact on is-approved column of the table*/

    /**
     * Creates a new Translation for all System-label with-in Screen-Windows.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreateWindowLabel($id)
    {
        //fetching information for screen windows
        $window = ScreenWindow::findOne($id);

        //fetching all system_labels attached with this screen-window
        $systemLabel = Yii::$app->db->createCommand('SELECT * FROM system_labels where window_id = ' . $id . ' and translatable = 1')->queryAll();

        //initialize array
        $field = array();

        //making system-labels list for showing under each record
        foreach ($systemLabel as $label) {
            $field[] = "translation_" . $label['label_id'];
            $translationData = Translation::find()->where(["label_id" => $label['label_id'], "language_id" => \Yii::$app->session->get('languageId'), "is_approved" => 1])->one();
            $user = User::find()->where(["id" => $translationData['created_by']])->one();
            $translation[$label['label_id']]['translation'] = $translationData['translation'];
            $translation[$label['label_id']]['created_by'] = ucfirst($user['username']);
        }

        //creating new dynamic model on runtime
        $model = new \yii\base\DynamicModel($field);

        $model->addRule($field, 'string')->addRule($field, 'safe'); //addRule($field, 'required')->
        //'string', ['max' => 255]

        //checking is form submitted
        if ($model->load(Yii::$app->request->post())) {

            //preparing and validate data to save
            foreach ($field as $fieldValue) {
                $fieldName = array();
                $fieldName[] = explode("_", $fieldValue);
                if (!empty($model->$fieldValue)) {
                    $translation = new Translation();
                    $translation->label_id = $fieldName[0][1];
                    $translation->language_id = \Yii::$app->session->get('languageId');
                    $translation->created_by = Yii::$app->user->id;
                    $translation->translation = $model->$fieldValue;

                    if ($translation->save()) {

                        //showing success message
                        \Yii::$app->getSession()->setFlash('success', 'Translation(s) created successfully.');
                    } else {
                        //showing error message
                        \Yii::$app->getSession()->setFlash('error', 'Translation(s) cannot be created. Please try again.');
                    }
                } else {
                    //in case translation not found in that label or label not found in screen-window
                    $translation = array();
                }
            }

            //fetching screen-window with system-label data
            $window = ScreenWindow::find()->innerJoinWith('label', 'label.window_id = ScreenWindow.window_id')
                ->where(['>', 'screen_windows.window_id', $id])->one();

            //checking for empty results
            if (!empty($window['window_id'])) {
                //redirecting to the view
                return $this->redirect(['translation/create-window-label', 'id' => $window['window_id']]);
            } else {
                //redirecting to the view
                return $this->redirect(['screen-window/window-label']);
            }

        } else {
            //checking for empty results
            if (empty($translation))
                $translation = array();

            //if form is not submitted
            //fetching data from types to get types string value
            $typeData = Types::find()
                ->where(['type_id' => $window['type_id']])
                ->one();

            //setting perticular type name for detail view
            $type = $typeData['type_name'];

            //fetching all screenshots images for view page
            $screenshotData = Yii::$app->db->createCommand('SELECT image,screenshot_id FROM screenshots where window_id = ' . $window->window_id)->queryAll();

            //showing input form
            return $this->render('create_window_label', [
                'model' => $model,
                'systemLabel' => $systemLabel,
                'window' => $window,
                'type' => $type,
                'translation' => $translation,
                'screenshotData' => $screenshotData,
            ]);
        }
    }

    /* Function to make Not-Approved translation Approved and Approved to Not-Approved */
    /*public function actionToggleApprove($id)
    {
        //fetching translation
        $isApproved = Translation::find()->where(["translation_id" => $id])->one();
        $toggle = 0;
        $status = "Not-Approved";
        if (!$isApproved['is_approved']) {
            $toggle = 1;
            $status = "Approved";
        }

        Yii::$app->db->createCommand()->update('translation', ['is_approved' => 0], 'label_id = :id', [':id' => $isApproved['label_id']])->execute();

        $isApproved->is_approved = $toggle;
        $isApproved->save();
        \Yii::$app->getSession()->setFlash('success', 'Translation has been marked as (' . $status . ') successfully.');
        return $this->redirect(['index']);
    }*/

    /**
     * Updates an existing Translation model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        //getting perticular record from database
        $model = $this->findModel($id);

        //check if form submitted then validate data and store in database
        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            //showing success message and redirect to list page
            \Yii::$app->getSession()->setFlash('success', 'Translation updated successfully.');
            //return $this->redirect(['view', 'id' => $model->translation_id]);
            return $this->redirect(['index']);
        } else {
            //fetching system-labels
            $systemLabel = ArrayHelper::map(SystemLabel::find()->all(), 'label_id', 'label');

            //fetching screenshots
            $screenshotData = (new \yii\db\Query())
                ->select('*')
                ->from('screenshots')
                ->where(['window_id' => $model->label->window_id])
                ->all();

            //checking logged in user role
            if (!\Yii::$app->user->identity->isAdmin) {
                return $this->render('update_translator', [
                    'model' => $model,
                    'systemLabel' => $systemLabel,
                    'screenshotData' => $screenshotData,
                ]);

            }

            //getting languages data from database
            $languages = ArrayHelper::map(Language::find()->all(), 'language_id', 'language_name');

            //creating input form
            return $this->render('update', [
                'model' => $model,
                'systemLabel' => $systemLabel,
                'languages' => $languages,
                'screenshotData' => $screenshotData,
            ]);
        }
    }

    /**
     * Deletes an existing Translation model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        //delete record from database
        $this->findModel($id)->delete();

        //showing success message and redirect to list page
        \Yii::$app->getSession()->setFlash('success', 'Translation removed successfully.');
        return $this->redirect(['index']);
    }

    /* Function to bulk approve the translations, only super admin can*/
    public function actionApproveall()
    {
        //making each key
        $keyArray = explode(",", str_replace('"', '', $_GET['keylist']));

        //loop for all keys
        foreach ($keyArray as $key) {

            //fetching translation
            $translation = $this->findModel($key); // Translation::find()->one();
            //if translation exists
            if (!empty($translation)) {

                //make it apprived and save
                $translation->is_approved = 1;
                $translation->save();
                //echo "saved";
            }

        }
        //returning result
        $array = (["result" => "done"]);
        echo json_encode($array);
        //echo json_encode($keyArray);
        exit;
    }

    /* Function to bulk dis-approve the translations, only super admin can*/
    public function actionDisapproveall()
    {
        //making each key
        $keyArray = explode(",", str_replace('"', '', $_GET['keylist']));

        //loop for all keys
        foreach ($keyArray as $key) {
            //fetching translation
            $translation = $this->findModel($key);
            if (!empty($translation)) {

                //make it dis-apprived and save
                $translation->is_approved = 0;
                $translation->save();
            }

        }
        //returning result
        echo json_encode("DONE");
        //echo json_encode($keyArray);
        exit;
    }

    //debugging function commenting not required
    protected function debug($array)
    {
        echo "<pre>";
        print_r($array);
        exit;
    }

    /* Function to import IOS labels from .string file, one time job, will be removed when all data synchronized so no need to commenting*/
    public function actionImportIos()
    {
        //$file = "http://localhost/tp/backend/uploads/csv/example2.txt";
        $file = "http://localhost/tp/backend/uploads/csv/ios_labels.txt";
        $fp = fopen($file, "r");

        //running loop for every line read
        while ($line = fgets($fp, 1000)) {

            //breaking the line into words
            $xplodArray = explode("=", str_replace(['"', ";"], "", $line));

            //checking for empty resuts
            if (sizeof($xplodArray) > 1) {

                //fetching system-labels with access_key available already into database
                $labelData = SystemLabel::find()->where(["access_key_ios" => trim($xplodArray[0])])->one();
                //echo $labelData['label_id'] . "<br />";

                //check if not already exists into database
                if (!empty($labelData['label_id'])) {

                    //fetching translation for that label
                    $translationData = Translation::find()->where(['translation' => trim($xplodArray[1]), "label_id" => $labelData['label_id']])->one();
                    if (empty($translationData['translation_id'])) {
                        /* $translation = new Translation();
                         $translation->label_id = $labelData['label_id'];
                         $translation->language_id = 4;
                         $translation->is_approved = 1;
                         $translation->created_by = 1;
                         $translation->translation = trim($xplodArray[1]);
                         $translation->save();*/
                        echo "<br />empty translation " . "== " . $xplodArray[0] . " == " . $xplodArray[1];
                    }
                } else {
                    /*$model = new SystemLabel();
                    $model->window_id = 0;
                    $model->label = trim($xplodArray[1]);
                    $model->access_key_ios = $xplodArray[0];

                    $model->save();*/

                    echo "<br />not  " . "== " . $xplodArray[0] . " == " . $xplodArray[1];
                    //echo $xplodArray[0] . "<br />";
                }

            }
        }
    }

    /** function to add translations from file, one time job, will be removed when all data synchronized so no need to commenting*/
    public function actionImportAndroid()
    {
        $xmlStr = file_get_contents('http://localhost/tp/backend/uploads/csv/android_portoguese_strings.xml');
        $xml = simplexml_load_string($xmlStr);

        //loop through the each node of molecule
        foreach ($xml->string as $record) {
            $arrXml = (array)$record;
            if (!empty($arrXml[0])) {

                $labelData = SystemLabel::find()->where(["access_key_android" => $arrXml['@attributes']['name']])->one();
                if (!empty($labelData['label_id'])) {
                    $translationData = Translation::find()->where(['translation' => trim($arrXml[0]), "label_id" => $labelData['label_id']])->one();
                    if (empty($translationData['translation_id'])) {
                        $translation = new Translation();
                        $translation->label_id = $labelData['label_id'];
                        $translation->language_id = 4;
                        $translation->is_approved = 1;
                        $translation->created_by = 1;
                        $translation->translation = trim($arrXml[0]);
                        $translation->save();
                    }

                    //echo $arrXml['@attributes']['name'];
                } else {
                    echo $arrXml['@attributes']['name'];
                }
            }

        }
    }

}
