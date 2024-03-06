# Prometheu-GrafanaOnEKSbyTerraform

Projeto de Deploy do Prometheus e Grafana no Cluster EKS com Terraform.


## Pré-Requisitos

* Terraform

* AWS CLI configurado com suas credenciais

* Bucket S3

## Preparação

### Backend

Colocar os parametros de backend dentro do arquivo **providers.tf** para armazenamento do state remoto do Terraform no bucket AWS.

```hcl
backend "s3" {
    bucket = "<SEU_BUCKET>"
    key    = "<PASTA>/terraform.tfstate"
    region = "<REGIAO_DO_BUCKET>"
  }
```

### Variaveis
A titulo de organização e manutenção o contexto kubernets é definido na variavel ***contexto*** dentro do arquivo ***terraform.tfvars***.


### Inicializando Backend

Após preparação das variáveis e configuração do Backend já inicializar nosso projeto terraform, para downloads das dependências do projeto e inicialização do backend execute

```
terraform init
```

### Plan

Uma vez inicializado o backend, podemos rodar o plan para o terraform planejar e preparar o provisionamento da estrutura

```
terraform plan
```

### Apply

Se o plan ocorrer sem erros é provavel que todas as variáveis tenham sido informadas corretamente e o codigo está pronto para ser executado e provisionar a estrutura conforme o que saida do comando plan no terminal. Para provisionar sua estrutura você pode rodar os seguintes comandos:

* Com confirmação
```
terraform apply
```

* Sem confirmação
```
terraform apply --auto-approve
```

### Concluido

Com apenas poucos comandos foi provisionada a stack completa de observabilidade do prometheus que conta com.

* Prometheus
* Node Exporter
* Alert Manager
* Grafana
* Dashboards

## Destruindo a Estrutura

No caso de necessidade de eliminiar a estrutura basta

* Planejar a destruição
```
terraform plan -destroy
```

* Executar com confirmação
```
terraform apply -destroy
```
Ou
* Executar sem confirmação
```
terraform apply -destroy --auto-approve
```


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.38.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.12.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.26.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_prometheus-operator"></a> [prometheus-operator](#module\_prometheus-operator) | ./modules/prometheus-operator | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_contexto"></a> [contexto](#input\_contexto) | Contexto para adicionar o Recurso | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->