WORKING_DIR=$HOME/dim_reduction_via_compressed_sensing
OUTPUT_DIR=$WORKING_DIR/output
INPUT_DATA=$WORKING_DIR/data/merge-2014-11-02_to_2014-11-16.dat
INPUT_LABEL=$WORKING_DIR/data/truth_data-2014-11-02_to_2014-11-16.txt
START=2

if [ $START -lt 2 ];then
	python $WORKING_DIR/window.py $INPUT_DATA $INPUT_LABEL $OUTPUT_DIR
elif [ $START -lt 3 ];then
	python $WORKING_DIR/reduce.py $OUTPUT_DIR/windowed $INPUT_LABEL $OUTPUT_DIR/reduced_1200 1200
elif [ $START -lt 4 ];then
	python $WORKING_DIR/svm_bracketing.py $OUTPUT_DIR/reduced/svm_total 1200
else
	echo "done"
fi
