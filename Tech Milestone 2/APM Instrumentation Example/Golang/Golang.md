# Golang Example
- This shows a dummy application with Datadog Tracer implemented.
- gorillamux is used as the router > and this uses Datadog Automatic Instrumentation (https://pkg.go.dev/gopkg.in/DataDog/dd-trace-go.v1/contrib/gorilla/mux)
- getErrorRequest and api endpoints are custom instrumented using Datadog Custom Instrumentation
---
## Outcome
![Example Flame Graph in Datadog](image.png)
