from starlette.applications import Starlette
from starlette.staticfiles import StaticFiles

app = Starlette(debug=True)
app.mount("/", StaticFiles(directory="/var/www/html", html=True))
