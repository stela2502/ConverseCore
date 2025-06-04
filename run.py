from flask_ollama_web.routes import app
from flask_ollama_web.userdb import init_db, get_available_models

if __name__ == "__main__":
    init_db()
    app.run(host="0.0.0.0", port=8080)

