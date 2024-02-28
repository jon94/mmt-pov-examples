from ddtrace.contrib.wsgi import DDWSGIMiddleware

# Create simple WSGI app
def test_app(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/html')])
    return [b"Hello, World!"]

# Wrap the WSGI app with Datadog Middleware
application = DDWSGIMiddleware(test_app)