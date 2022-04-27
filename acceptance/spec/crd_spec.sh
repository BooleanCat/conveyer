Describe 'crd'
  setup() { kubectl create namespace conveyer-test 1>/dev/null; }
  teardown() { kubectl delete namespace conveyer-test 1>/dev/null; }

  BeforeAll 'setup'
  AfterAll 'teardown'

  It 'creates the pipeline CRD'
    When call kubectl --namespace conveyer-test apply --filename ../crd/pipeline.yaml
    The output should include ''
    The status should be success
  End

  It 'creates an empty pipeline'
    When call kubectl --namespace conveyer-test apply --filename fixtures/empty-pipeline.yaml
    The output should include ''
    The status should be success
  End

  It 'gets the pipeline'
    When call kubectl --namespace conveyer-test get pipeline/empty
    The output should include 'empty'
    The status should be success
  End

  It 'gets the pipeline by abbreviation'
    When call kubectl --namespace conveyer-test get pl/empty
    The output should include 'empty'
    The status should be success
  End

  It 'creates a pipeline with a job containing a task'
    When call kubectl --namespace conveyer-test apply --filename fixtures/hello-task-pipeline.yaml
    The output should include ''
    The status should be success
  End
End
