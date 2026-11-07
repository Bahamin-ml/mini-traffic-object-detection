FROM pytorch/pytorch:2.9.0-cuda12.6-cudnn9-runtime

WORKDIR /workspace

COPY requirements.txt .

RUN pip install --no-cache-dir --retries 10 --timeout 120 --resume-retries 10 -r requirements.txt

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]