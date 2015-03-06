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

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create task" do
    sign_in users(:one)
    assert_difference('Task.count') do
      post :create, task: { name: @task.name, status: @task.status, user_id: @task.user_id }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    sign_in users(:one)
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    sign_in users(:one)
    patch :update, id: @task, task: { name: @task.name, status: @task.status, user_id: @task.user_id }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    sign_in users(:one)
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
