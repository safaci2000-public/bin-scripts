#!/usr/bin/zsh

APPNAME=$(basename "${0}")

C_USERNAME=$(whoami)



usage()
{
    echo "usage ${APPNAME} [options] command <command options>"
    echo " general options:"
    echo "    -o               Output Directory"
    echo "    -r               CVS repo path"
    echo "    -h               This message"
    echo "    -u               Sets CVS username"
    exit $1
}

doSanityCheck()
{

   if  test  "${OUTDIR:+1}"; then
       echo "OUTDIR: ${OUTDIR}"
   else
       echo "ERROR: OUTDIR is not set"
       usage 1
   fi

   if  test  "${REPO:+1}"; then
       echo "REPO: ${REPO}"
   else
       echo "ERROR: REPO is not set"
       usage 1
   fi

}

main()
{
    mkdir $OUTDIR
    cd $OUTDIR
    mkdir -p $OUTDIR-cvs
    mkdir -p $OUTDIR-git
    
    echo "USER: $C_USERNAME"
    
    cvs checkout  -d :ext:$C_USERNAME@cvs.wolfram.com:/cvs   -d $OUTDIR-cvs $REPO
    echo "git cvsimport -v -k $REPO"
    cd $OUTDIR-git; git cvsimport -d :ext:$C_USERNAME@cvs.wolfram.com:/cvs -r cvs -v  $REPO
    #cd $OUTDIR-git; git cvsimport -d :ext:$C_USERNAME@cvs.wolfram.com:/cvs -r cvs -o HEAD  -v -k $REPO
}

while getopts 'o:r:u:h' arg; do
    case "${arg}" in
        o) OUTDIR="${OPTARG}" ;;
        r) REPO="${OPTARG}" ;;
        u) C_USERNAME="${OPTARG}" ;;
        h|?) usage 0 ;;
        *) echo "invalid argument '${arg}'"; usage 1 ;;
    esac
done

doSanityCheck


alias cvs='cvs -d :ext:$C_USERNAME@cvs.wolfram.com:/cvs'
main
