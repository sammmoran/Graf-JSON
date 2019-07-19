local grafana = import '$LOCAL_PATH';
local dashboard = grafana.dashboard;
local row - grafana.row;
local graph = grafana.graphPanel;
local cloudwatch = grafana.cloudwatch;
local template = grafana.template;

dashboard.new(
  'CloudWatch Test',
  editable=true,
  schemaVersion=16,
)

.addPanel(
  graph.new(
    title='MY_TITLE',
    span=2,
    description='DESCRIPTION',
    datasource='DATA_SOURCE',
  )
  .addTarget(
    cloudwatch.target(
      region='REGION',
      namespace='NAMESPACE',
      metric='CPUUtilization',
      datasource='DATA_SOURCE',
      statistics='Average',
      dimensions={
        'ClusterName':'CLUSTER_NAME'
      }
    )
  
  ),
  gridPos={
    x:0,
    y:0,
    w:8,
    h:10
  }
)
