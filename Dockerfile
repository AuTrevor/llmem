from python:3.12.2-slim-bookworm

COPY ./ /src
RUN pip wheel --no-deps /src && pip install  --no-cache-dir llmem*.whl && rm -rf /src

#Uncomment the following line to use another OpenAPI compliant endpoint.
#ENV OAI_BASE_URL "http://host.docker.internal:11434/v1/chat/completions"

WORKDIR /workspace
ENTRYPOINT [ "uvicorn", "llmem:app", "--host", "0.0.0.0"]
EXPOSE 8000