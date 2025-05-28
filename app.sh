# Start Ollama daemon in background
ollama serve &
OLLAMA_PID=$!

trap "echo 'Stopping Ollama...'; kill $OLLAMA_PID; wait $OLLAMA_PID" EXIT

# Start stable-diffusion webui in background (optional)
#cd /app/stable-diffusion-webui
#./venv/bin/python launch.py --listen --skip-torch-cuda-test &

# Start Flask webserver
python -m flask_ollama_web.run 

