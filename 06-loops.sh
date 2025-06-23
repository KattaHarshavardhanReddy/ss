USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

logs_folder="/var/log/ss-logs/"
logs_files="$(echo $0 | cut -d "." -f1)"
Timestamp=$(date +%y-%m-%d-%H-%M-%S)
Log_Name="$logs_folder/$logs_files-$Timestamp.log"

# we are writing the function
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 installation is $R failed $N"
        exit 1
    else
        echo -e "$2 $G installed $N"
    fi
}

echo " Script started at: $Timestamp " &>>$Log_Name

if [ $USERID -ne 0 ]
then
    echo "ur not root"
    exit 1
fi

for package in $@
do
    dnf list installed $package &>>$Log_Name
    if [ $? -ne 0 ]
    then 
    dnf install $package -y &>>$Log_Name
    VALIDATE $? "install $package"
    else 
    echo "$package is already installed"
done