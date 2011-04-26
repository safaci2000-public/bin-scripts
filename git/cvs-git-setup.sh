#!/bin/bash -l

APPNAME=$(basename "${0}")

OUTDIR="samir"
REPO="samir"


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

cvs checkout   -d $OUTDIR-cvs $REPO
echo "git cvsimport -v $REPO"
cd $OUTDIR-git; git cvsimport -v $REPO
