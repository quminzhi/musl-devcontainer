IMAGE_NAME = musl-dev-test
DOCKERFILE = .devcontainer/Dockerfile
CONTEXT = .devcontainer # VSCode taks .devcontainer as the context
PROJECT_DIR = $(shell pwd)

.PHONY: all build run clean

all: build run clean submodule

build:
	@echo "🔨 Building Docker image..."
	docker build -f $(DOCKERFILE) -t $(IMAGE_NAME) $(CONTEXT)

run:
	@echo "🚀 Running container..."
	docker run -it --rm -v "$(PROJECT_DIR)":/workspaces/musl-dev $(IMAGE_NAME)

submodule:
	git submodule update --init --recursive

clean:
	@echo "🧹 Removing Docker image..."
	docker rmi -f $(IMAGE_NAME) || true
