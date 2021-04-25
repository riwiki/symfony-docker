init:
	./dc.sh run app rm .gitkeep
	./dc.sh run app symfony new --full --dir=. --no-git
	# TODO for each layer in dc.lock, run the respective init-* target.
	./dc.sh up

init-comfort:
	./dc.sh run app symfony composer req maker --dev
	./dc.sh run app symfony composer req annotations

init-db:
	./dc.sh run app composer require symfony/orm-pack
	./dc.sh run app composer require --dev symfony/maker-bundle

up:
	./dc.sh up

bash:
	./dc.sh exec app bash

clean:
	git checkout -- app