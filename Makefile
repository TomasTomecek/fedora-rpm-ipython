clean:
	rm -f ./*.src.rpm

build: srpm
	mock -r fedora-20-x86_64 --rebuild ./*.src.rpm --verbose

srpm: clean
	@rpmbuild -bs ./*.spec --define "_sourcedir ." --define "_specdir ." --define "_srcrpmdir ."

rpm: srpm
	@rpmbuild --rebuild ./*.src.rpm --define "_rpmdir ."

