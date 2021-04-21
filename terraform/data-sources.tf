data "aws_availability_zones" "available" {
    state = "available"
}

data "template_file" "hosts" {
  template = "${file("${path.module}/../ansible/hosts.template")}"
  depends_on = [
    "aws_instance.web_1",
    "aws_instance.web_2",
    "aws_instance.load_balancer",
  ]
  vars {
    web_1 = aws_instance.web_1.private_ip
    web_2 = aws_instance.web_2.private_ip
    load_balancer = aws_instance.load_balancer.private_ip
  }
}

resource "null_resource" "created-hosts" {
  triggers {
    template_rendered = "${data.template_file.hosts.rendered}"
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.hosts.rendered}' > ${path.module}/../ansible/hosts"
    interpreter = ["sh", "-c"]
  }
}