test: ensure-env-exists execute-export increment-run

execute-export:
	export VERSION=2.2.$(shell . .env && echo $$RUN) PROJECT=nuget/Versy && cd .. && sh .sh nuget

ensure-env-exists:
	test -f .env || echo "RUN=1" > .env

increment-run:
	perl -i -pe 's/^RUN=(\d+)$$/"RUN=" . ($$1+1)/e' .env