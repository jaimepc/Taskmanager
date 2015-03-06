require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "Deberia redirigir si no esta autenticado" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "Deberia agregar una nueva tarea" do
    sign_in users(:one)
    get :new
    assert_response :success
  end
  
  test "No deberia crear una tarea sin autenticarse" do
    assert_no_difference('Task.count') do
      post :create, task: { name: @task.name, status: @task.status, user_id: @task.user_id }
    end
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should create task" do
    sign_in users(:one)
    assert_difference('Task.count') do
      post :create, task: { name: @task.name, status: @task.status, user_id: @task.user_id }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "No deberia mostrar la tarea sin autenticarse" do
    get :show, id: @task
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should show task" do
    sign_in users(:one)
    get :show, id: @task
    assert_response :success
  end
  
  test "No deberia editar sin autenticarse" do
    get :edit, id: @task
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should get deit" do
    sign_in users(:one)
    get :edit, id: @task
    assert_response :success
  end

  test "No deberia actualizar la tarea sin autenticarse" do
    patch :update, id: @task, task: { name: @task.name, status: @task.status, user_id: @task.user_id }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should update task" do
    sign_in users(:one)
    patch :update, id: @task, task: { name: @task.name, status: @task.status, user_id: @task.user_id }
    assert_redirected_to task_path(assigns(:task))
  end

  test "No deberia eliminar la tarea sin autenticarse" do
    assert_no_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should destroy task" do
    sign_in users(:one)
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
