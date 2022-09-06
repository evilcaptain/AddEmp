FROM amazonlinux:latest

RUN yum update -y && yum install python-pip python-dev -y

COPY ./requirements.txt /app/addemp/requirements.txt
WORKDIR /app/addemp
RUN pip install -r requirements.txt

COPY ./AddEmp.py /app/addemp/AddEmp.py
COPY ./AddEmp.html /app/addemp/templates/AddEmp.html
COPY ./AddEmpOutput.html /app/addemp/templates/AddEmpOutput.html

EXPOSE 80

ENTRYPOINT ["python2", "AddEmp.py"]
