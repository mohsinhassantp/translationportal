<?php

namespace backend\controllers;

use backend\models\SystemLabel;
use backend\models\Types;
use Yii;
use backend\models\ScreenWindow;
use backend\models\SearchScreenWindow;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\models\Screenshot;
use yii\web\UploadedFile;
use yii\helpers\ArrayHelper;
use yii\filters\AccessControl;
use common\components\AccessRule;
use common\models\User;


/**
 * ScreenWindowController implements the CRUD actions for ScreenWindow model.
 */
class ScreenWindowController extends Controller
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
                'only' => ['index', 'create', 'update', 'delete', 'window-label'],
                'rules' => [
                    [
                        'actions' => ['window-label'],
                        'allow' => true,
                        // Allow users, moderators and admins to create
                        'roles' => [
                            User::ROLE_MODERATOR
                        ],
                    ],
                    [
                        'actions' => ['index', 'create', 'update', 'delete', 'window-label'],
                        'allow' => true,
                        // Allow admins
                        'roles' => [
                            User::ROLE_ADMIN
                        ],
                    ],
                ],
            ],
        ];
    }

    /**
     * Lists all ScreenWindow models.
     * @return mixed
     */

    public function actionIndex()
    {
        //getting data from database
        $searchModel = new SearchScreenWindow();

        //creating search data for list view
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        //showing list view
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /* List view for screen windows and label combination*/
    public function actionWindowLabel()
    {
        //fetching data from database
        $searchModel = new SearchScreenWindow();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        //checking logged in user role to view as per role
        if (\Yii::$app->user->identity->isAdmin) {
            //showing list view
            return $this->render('window_label', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
        } else {
            //showing list view
            return $this->render('window_label_translator', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
        }

        //showing list view

    }

    /* Create translation with showing screen windows, labels in single page*/
    public function actionCreateTranslation()
    {
        //return $this->redirect(['translation/create-window-label','id' => $id]);
        $this->redirect("translation/createTranslation");

    }

    /*Redirecting function for translators*/
    public function actionCreateTranslationWindowLabel($id)
    {
        return $this->redirect(['translation/create-window-label', 'id' => $id]);
    }

    /**
     * Displays a single ScreenWindow model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        //fetching all screenshots images for view page
        $screenshotRows = (new \yii\db\Query())
            ->select('*')
            ->from('screenshots')
            ->where(['window_id' => $id])
            ->all();

        //showing form for view
        return $this->render('view', [
            'model' => $this->findModel($id),
            'screenshotRows' => $screenshotRows,
        ]);
    }

    /**
     * Creates a new ScreenWindow model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        //create new instance for screen_windows
        $model = new ScreenWindow();

        if ($model->load(Yii::$app->request->post())) {

            //making image empty for new image
            $model->image = "";

            //saving model value as posted
            if ($model->save()) {

                //getting images instance
                $images = UploadedFile::getInstances($model, 'image');

                //check if any image available
                if ($images) {

                    //loop for multiple images uploading
                    foreach ($images as $image) {

                        //creating new image name
                        $filename = Yii::$app->security->generateRandomString() . '.' . $image->extension;

                        //setting saving path for image
                        $path = '../uploads/' . $filename;

                        //checking uploaded file types
                        $allowed = array("jpg" => "image/jpg", "jpeg" => "image/jpeg", "gif" => "image/gif", "png" => "image/png");
                        if (!array_key_exists($image->extension, $allowed)) {

                            //showing error message and redirect to list page
                            \Yii::$app->getSession()->setFlash('error', 'Please select a valid file format.');
                            return $this->redirect(['index']);
                        }

                        //processing image size limit validation for 5MB
                        $maxsize = 5 * 1024 * 1024;

                        if ($image->size > $maxsize) {

                            //showing error message and redirect to list page
                            \Yii::$app->getSession()->setFlash('error', 'File size is larger than the allowed limit(5MB).');
                            return $this->redirect(['index']);
                        }

                        //setting all columns values for new screenshot model
                        $Screenshotmodel = new Screenshot();
                        $Screenshotmodel->image = $filename;
                        $Screenshotmodel->window_id = $model->window_id;

                        //saving uploaded image on server
                        $image->saveAs($path);
                        if ($Screenshotmodel->save()) {
                            //showing success message and redirect to list page
                            \Yii::$app->getSession()->setFlash('success', 'Screen-window created successfully.');
                        } else {
                            //showing error message and redirect to list page
                            \Yii::$app->getSession()->setFlash('error', 'Any one or more images can not uploaded, Please try again.');
                        }
                    }
                }
            }
            return $this->redirect(['index']);
        } else {

            //getting types data from database
            $types = ArrayHelper::map(Types::find()->all(), 'type_id', 'type_name');

            //showing input form
            return $this->render('create', [
                'model' => $model,
                'types' => $types,
            ]);
        }
    }

    /**
     * Updates an existing ScreenWindow model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        //getting data from database
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            //setting success message
            \Yii::$app->getSession()->setFlash('success', 'Screen-window updated successfully.');

            //remove images from backend server

            if (!empty(Yii::$app->request->post('remove-image'))) {

                foreach (Yii::$app->request->post('remove-image') as $removeImage => $key) {
                    // removing data from database

                    Screenshot::find()->where(["image" => $key, "window_id" => $model->window_id])
                        ->one()->delete();

                    //physically remove image from the server

                    if (file_exists(dirname(dirname(__DIR__)) . "/backend/uploads/" . $key)) {
                        @unlink(dirname(dirname(__DIR__)) . "/backend/uploads/" . $key);
                    }
                }
            }

            //getting images instance
            $images = UploadedFile::getInstances($model, 'image');

            //check if any image available
            if ($images) {

                //loop for multiple images uploading
                foreach ($images as $image) {

                    //generating new name for submitted image
                    $filename = Yii::$app->security->generateRandomString() . '.' . $image->extension;

                    //setting server path for storing image
                    $path = '../uploads/' . $filename;

                    //checking uploaded file types
                    $allowed = array("jpg" => "image/jpg", "jpeg" => "image/jpeg", "gif" => "image/gif", "png" => "image/png");
                    if (!array_key_exists($image->extension, $allowed)) {

                        //setting error message and redirecting to list page
                        \Yii::$app->getSession()->setFlash('error', 'Please select a valid file format.');
                        return $this->redirect(['index']);
                    }

                    //processing image size limit validation for 5MB
                    $maxsize = 5 * 1024 * 1024;

                    if ($image->size > $maxsize) {
                        //setting error message and redirecting to list page
                        \Yii::$app->getSession()->setFlash('error', 'File size is larger than the allowed limit(5MB).');
                        return $this->redirect(['index']);
                    }

                    //setting all columns values for new screenshot model
                    $Screenshotmodel = new Screenshot();
                    $Screenshotmodel->image = $filename;
                    $Screenshotmodel->window_id = $model->window_id;

                    //saving uploaded image on server
                    $image->saveAs($path);
                    if ($Screenshotmodel->save()) {
                        //setting success message
                        \Yii::$app->getSession()->setFlash('success', 'Screen-window screenshot updated successfully.');
                    } else {
                        //setting error message
                        \Yii::$app->getSession()->setFlash('error', 'Any one or more images can not uploaded, Please try again.');
                    }
                }
            }
            //redirecting to list page
            return $this->redirect(['index']); //, 'id' => $model->window_id
        } else {

            //getting screenshot data from database
            //$screenShot = Screenshot::find()->where(['window_id' => $id]);

            //getting Types data
            $types = ArrayHelper::map(Types::find()->all(), 'type_id', 'type_name');

            //fetching data for screenshot
            $screenshotData = (new \yii\db\Query())
                ->select('*')
                ->from('screenshots')
                ->where(['window_id' => $model->window_id])
                ->all();

            return $this->render('update', [
                'model' => $model,
                //'screenShot' => $screenShot,
                'types' => $types,
                'screenshotData' => $screenshotData,
            ]);
        }
    }

    /**
     * Deletes an existing ScreenWindow model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {

        //fetching child relationship (screenshot and syste-labels) for this window_id
        $screenshot = Screenshot::findOne(['window_id' => $id]); //->where->one();
        $systemLabel = SystemLabel::findOne(['window_id' => $id]);

        if (empty($screenshot) && empty($systemLabel)) {

            //fetching perticular record from database and delete it
            $this->findModel($id)->delete();

            //setting success message
            \Yii::$app->getSession()->setFlash('success', 'Screen-window removed successfully.');
        } else {
            //showing success message and redirect to list page
            \Yii::$app->getSession()->setFlash('error', 'There are Screenshot/System-label available for this, Delete them first please');
        }

        return $this->redirect(['index']);
    }

    /**
     * Finds the ScreenWindow model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ScreenWindow the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        //checking database table and fetch data
        if (($model = ScreenWindow::findOne($id)) !== null) {
            return $model;
        } else {
            //throw exception if required
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
