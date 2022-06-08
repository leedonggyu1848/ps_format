g++ -o out solve.cpp && cat test.txt | ./out > rst && diff -c rst answer.txt

