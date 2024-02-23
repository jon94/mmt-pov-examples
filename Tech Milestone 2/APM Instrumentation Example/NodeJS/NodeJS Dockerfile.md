# NodeJS APM Instrumentation on Dockerfile
## For PM2 in cluster Mode
- Note: Ensure dd-trace is Initialized at the Very Beginning: For APM to capture all the necessary traces, it must be the first module that gets required and initialized in your application. This ensures it can hook into all the subsequent modules for tracing. The approach of including ['--require', 'dd-trace/init'] as args in the ecosystem.config.js might not be effectively ensuring this, especially in cluster mode with PM2.When using PM2 in cluster mode, each instance of the application runs in its own process. Datadog’s tracer should be initialized in a way that it’s the first thing running in each of these processes. This is usually achieved by requiring and initializing it in the very first line of your application’s entry point script (e.g., the first line of your main.js or whatever your entry point file is named).
 
If dd-trace/init is not being effectively required at the very beginning due to PM2's handling in cluster mode, consider directly requiring it at the top of your application’s main entry file. This is the most foolproof way to ensure it initializes first.
 
https://docs.datadoghq.com/tracing/trace_collection/automatic_instrumentation/dd_libraries/nodejs/#javascript
 
Once you do this via code, you should not need to make any changes to the pm2 CMD.
## Setting up Datadog APM Tracer
- The idea here is to install ddtrace as part of the dockerfile. (npm install)
- In this example repo. I've placed the ddtrace version in package.json and did a cpm install in line 11
- Beware to use the correct ddtrace version for your supported nodejs library.
- Thereafter, we need to alter the CMD line to --require dd-trace/init.
---
## Setting up App Container in Task Definition
- Refer to the relevant task definition
  - ECS Fargate: https://github.com/jon94/mmt-pov-examples/blob/main/Tech%20Milestone%201/Agent%20Installation%20and%20Configuration/ECS%20Fargate/Task%20Definition%20Example/taskdefinition_ecsfargate.json
  - ECS on EC2: https://github.com/jon94/mmt-pov-examples/blob/main/Tech%20Milestone%201/Agent%20Installation%20and%20Configuration/ECS%20on%20EC2/Task%20Definition%20Example/taskdefinition_app.json