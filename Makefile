update:
	ls *.rb | awk '{sub(/\.rb/, ""); print $0}' | xargs -n1 -I{} $(MAKE) update/{}

update/%:
	go run github.com/Songmu/maltmill/cmd/maltmill@main new -w handlename/$*
