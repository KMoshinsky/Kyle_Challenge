variable "ami" {}
variable "key" {}

resource "aws_instance" "webserver" {
    ami = "${var.ami}"
    instance_type = "t2.micro"
    vpc_security_group_ids = [
        "${aws_security_group.webserversg.id}"
    ]
    key_name = "${var.key}"
    user_data = "${data.local_file.webserverinit.content}"
    tags = {
        Name = "SREChallenge"
        TerraformCreated = "true"
        Repo = "https://github.com/KMoshinsky/Kyle_Challenge"
    }
}

resource "aws_security_group" "webserversg" {
    name = "webserversg"
    description = "Allow 80 and 443 ingress"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

data "local_file" "webserverinit" {
    filename = "${path.module}/webserverinit.yml"
}