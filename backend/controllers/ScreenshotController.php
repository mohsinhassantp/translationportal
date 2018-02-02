<?php

namespace backend\controllers;

use Yii;
use backend\models\Screenshot;
use backend\models\SearchScreenshot;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;
use backend\models\ScreenWindow;
use yii\helpers\ArrayHelper;
use yii\filters\AccessControl;
use common\components\AccessRule;
use common\models\User;


/**
 * ScreenshotController implements the CRUD actions for Screenshot model.
 */
class ScreenshotController extends Controller
{
    /**
     * @inheritdoc
     */
   /* public function behaviors()
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
                'only' => ['index','create', 'update', 'delete'],
                'rules' => [
                    [
                        'actions' => ['index','create', 'update', 'delete'],
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
     * Lists all Screenshot models.
     * @return mixed
     */
    public function actionIndex()
    {
        //fetching data from database
        $searchModel = new SearchScreenshot();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        //showing list view
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Screenshot model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {

        //showing view form
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Finds the Screenshot model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Screenshot the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        //check perticular record and through exception
        if (($model = Screenshot::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /** function disable because screenshots creating from screen_windows
     * Creates a new Screenshot model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        // redirecting to list view
        return $this->redirect(['index']);
        //create new instance of screenshot
        $model = new Screenshot();

        //check form submitted
        if ($model->load(Yii::$app->request->post())) {

            //getting images instance
            $images = UploadedFile::getInstances($model, 'image');

            //check if any image available
            if ($images) {

                //loop for multiple images uploading
                foreach ($images as $image) {

                    $filename = Yii::$app->security->generateRandomString() . '.' . $image->extension;
                    $path = '../uploads/' . $filename;

                    //checking uploaded file types
                    $allowed = array("jpg" => "image/jpg", "jpeg" => "image/jpeg", "gif" => "image/gif", "png" => "image/png");
                    if (!array_key_exists($image->extension, $allowed)) {

                        \Yii::$app->getSession()->setFlash('error', 'Please select a valid file format.');
                        return $this->redirect(['index']);
                    }

                    //processing image size limit validation for 5MB
                    $maxsize = 5 * 1024 * 1024;

                    if ($image->size > $maxsize) {
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
                        \Yii::$app->getSession()->setFlash('success', 'Record(s) created successfully.');
                    } else {
                        \Yii::$app->getSession()->setFlash('error', 'Any one or more images can not uploaded, Please try again.');
                    }
                }
                return $this->redirect(['index']);
            }
        } else {
            $model = new Screenshot();
            $screenWindow = ArrayHelper::map(ScreenWindow::find()->all(), 'window_id', 'window_name');
            return $this->render('create', [
                'model' => $model,
                'screenWindow' => $screenWindow,
            ]);
        }

    }

    /**
     * Updates an existing Screenshot model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        //fetching perticular record from database
        $model = $this->findModel($id);

        //storing current image value in variable
        $oldImage = $model->image;

        //check if form submitted
        if ($model->load(Yii::$app->request->post())) {

            //create instance of image submitted
            $model->image = UploadedFile::getInstance($model, 'image');

            //check if image is not submitted
            if (!empty($model->image)) {
                //creating new image name
                $fileName = Yii::$app->security->generateRandomString() . '.' . $model->image->extension;
                $path = "../uploads/" . $fileName;

                //remove physical image from server
                if (file_exists(dirname(dirname(__DIR__)) . "/backend/uploads/" . $oldImage)) {
                    @unlink(dirname(dirname(__DIR__)) . "/backend/uploads/" . $oldImage);
                }

                //uploading new image on server
                $model->image->saveAs($path);

                //setting new image name in database
                $model->image = $fileName;
            } else {
                //if image not submitted then keep storing current image
                $model->image = $oldImage;
            }
            //save record into database
            $model->save();

            //setting successful message
            \Yii::$app->getSession()->setFlash('success', 'Screenshot updated successfully.');

            //redirecting to list page
            return $this->redirect(['index']);
        } else {
            //getting screen_windows values from database
            $screenWindow = ArrayHelper::map(ScreenWindow::find()->all(), 'window_id', 'window_name');

            //showing update form
            return $this->render('update', [
                'model' => $model,
                'screenWindow' => $screenWindow,
            ]);
        }
    }

    /**
     * Deletes an existing Screenshot model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        //fetching perticular data from database
        $this->findModel($id)->delete();

        //setting successful message
        \Yii::$app->getSession()->setFlash('success', 'Screenshot removed successfully.');
        //redirecting to list view
        return $this->redirect(['index']);
    }
}
