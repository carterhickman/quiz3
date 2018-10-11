all:
		make build
		make doczip

myexe: college.o collegemain.o course.o
	g++ college.o collegemain.o course.o -o output

build: college.o collegemain.o course.o
	g++ college.o collegemain.o course.o -o output

college.o: college.cc college.h course.h node.h
	g++ -c college.cc

collegemain.o: collegemain.cc course.h node.h college.h
	g++ -c collegemain.cc

course.o: course.cc course.h
	g++ -c course.cc

clean:
	rm *.o output
	rm *.class output
	rm *.out output 
docs:
	doxygen college.cc college.h collegemain.cc course.cc course.h node.h tarray.h ./Doxyfile

doczip:
		tar -cvzf tarballname.tar.gz html
