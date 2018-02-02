<?php

namespace backend\controllers;

use Yii;
use backend\models\Types;
use backend\models\TypesSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\components\AccessRule;
use common\models\User;

/**
 * TypesController implements the CRUD actions for Types model.
 */
class TypesController extends Controller
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
                    /*[
                        'actions' => ['index',],//'createTranslation'
                        'allow' => true,
                        // Allow users, moderators and admins to create
                        'roles' => [
                            /*User::STATUS_ACTIVE,* /
                            User::ROLE_MODERATOR,
                            /* User::ROLE_ADMIN* /
                        ],
                    ],*/
                    /*[
                        'actions' => ['update'],
                        'allow' => true,
                        // Allow moderators and admins to update
                        'roles' => [
                            User::ROLE_MODERATOR,
                            User::ROLE_ADMIN
                        ],
                    ],*/
                    [
                        'actions' => ['index', 'create', 'update', 'delete'],
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
     * Lists all Types models.
     * @return mixed
     */
    public function actionIndex()
    {
        //getting data from database
        $searchModel = new TypesSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        //creating list view with data
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Types model.
     * @param string $id
     * @return mixed
     */
    public function actionView($id)
    {
        //setting data and create view
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Types model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        //create new types instance
        $model = new Types();

        //check form is submitted then validate data and store into database
        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            //showing success message and redirect to view page
            \Yii::$app->getSession()->setFlash('success', 'Type created successfully.');
            return $this->redirect(['view', 'id' => $model->type_id]);
        } else {
            //if form not submitted create input form
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Types model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
    public function actionUpdate($id)
    {

        //setting data for update
        $model = $this->findModel($id);

        //if form submitted then validate data and store into databasee
        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            //showing success message and redirect to view page
            \Yii::$app->getSession()->setFlash('success', 'Type updated successfully.');
            return $this->redirect(['view', 'id' => $model->type_id]);
        } else {
            //if form is not submitted then create input form
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Types model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {

        //fetching the screen-window for this type
        $screeWindow = \backend\models\ScreenWindow::findOne(['type_id' => $id]); //->where->one();

        //checking for empty record
        if (empty($screeWindow)) {

            //removing from database
            $this->findModel($id)->delete();

            //showing success message and redirect to list page
            \Yii::$app->getSession()->setFlash('success', 'Type removed successfully.');
        } else {
            //showing success message and redirect to list page
            \Yii::$app->getSession()->setFlash('error', 'There are Screen-window available for this, Delete them first please');
        }

        return $this->redirect(['index']);
    }

    /**
     * Finds the Types model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Types the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        //getting model if not available throw exception
        if (($model = Types::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
