#!/usr/bin/zsh

APPNAME=$(basename "${0}")

OUTDIR="samir"
REPO="samir"
C_USERNAME="samirf"
alias cvs='cvs -d :ext:$C_USERNAME@cvs.wolfram.com:/cvs'



usage()
{
    echo "usage ${APPNAME} [options] command <command options>"
    echo " general options:"
    echo "    -o               Output Directory"
    echo "    -r               CVS repo path"
    echo "    -h               This message"
    exit $1
}

while getopts 'o:r:h' arg; do
    case "${arg}" in
        o) OUTDIR="${OPTARG}" ;;
        r) REPO="${OPTARG}" ;;
        h|?) usage 0 ;;
        *) echo "invalid argument '${arg}'"; usage 1 ;;
    esac
done


if [ -z $4 ]                                                                                                                                                   
then                                                                                                                                                           
    usage 0;
fi  

mkdir $OUTDIR
cd $OUTDIR
mkdir -p $OUTDIR-cvs
mkdir -p $OUTDIR-git

echo "USER: $C_USERNAME"

cvs checkout  -d :ext:$C_USERNAME@cvs.wolfram.com:/cvs   -d $OUTDIR-cvs $REPO
echo "git cvsimport -v -k $REPO"
cd $OUTDIR-git; git cvsimport -d :ext:$C_USERNAME@cvs.wolfram.com:/cvs -r cvs   -v -k $REPO
#cd $OUTDIR-git; git cvsimport -d :ext:$C_USERNAME@cvs.wolfram.com:/cvs -r cvs -o HEAD  -v -k $REPO
