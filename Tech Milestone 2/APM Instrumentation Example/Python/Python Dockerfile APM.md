# Python APM Instrumentation on Dockerfile
## Setting up Datadog APM Tracer
- The idea here is to install ddtrace as part of the dockerfile. (pip install ddtrace)
- In this example repo. I've placed the ddtrace version in requirements.txt and did a pip install in line 14.
- Thereafter, we need to alter the entrypoint and cmd to include ddtrace-run
---
## Setting up App Container in Task Definition
- Refer to the relevant task definition
  - ECS Fargate: https://github.com/jon94/mmt-pov-examples/blob/main/Tech%20Milestone%201/Agent%20Installation%20and%20Configuration/ECS%20Fargate/Task%20Definition%20Example/taskdefinition_ecsfargate.json
  - ECS on EC2: https://github.com/jon94/mmt-pov-examples/blob/main/Tech%20Milestone%201/Agent%20Installation%20and%20Configuration/ECS%20on%20EC2/Task%20Definition%20Example/taskdefinition_app.json