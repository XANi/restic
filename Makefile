.PHONY: all clean test restic

all: restic

restic:
	go run build.go

clean:
	rm -f restic

test:
	go test ./cmd/... ./internal/...

doc: restic
	./restic generate --zsh-completion doc/zsh-completion.zsh
	./restic generate --fish-completion doc/fish-completion.fish
	./restic generate --powershell-completion doc/powershell-completion.ps1
	./restic generate --bash-completion doc/bash-completion.sh
	./restic generate --man doc/man
