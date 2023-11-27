set -e
CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -e 'student-submission/ListExamples.java' ]]
then
    echo "File exist"
else
    echo "wrong file submitted"
fi

cp -r student-submission/ListExamples.java grading-area
cp -r TestListExamples.java grading-area
cd grading-area

javac -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" *.java

if [[ $? -eq 0 ]]
then
    echo "compile success"
    java -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" org.junit.runner.JUnitCore ListExamples.java
    
else
    echo "compile error!!!"
fi
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
