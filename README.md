
# Paginator :gb:
Pager for listings in Prestashop.


# Paginator :de:
Pager for listings in Prestashop.


# Paginator :es:
Paginador para listados en Prestashop.

### Objetivo
Es un poco de código para poder crear paginaciones en los módulos de Administración de Prestashop.

### Ejemplo de Uso

Nuestro código ha de poder generar un parámetro llamado que contenga el número de página. En este ejemplo se llama "page".

*Ejemplo de uso:*

Con este código inicializamos el proceso de creación de paginación y obtenemos un array con parámetros.

```
$page = Tools::getValue('page');
$consult = $this->repositories->listReports2();
$urlBase = "index.php?controller=NAME_CONTROLLER"
                     ."&token=".Tools::getValue('token');
$paginator = Paginator::pagination($page, $consult, 20, $urlBase, 5);

```
 Explicación de éste código:

* **$page**:  recogemos el parámetro GET donde se almacena el número de página.
* **$consult**: Es la consulta debemos hacer una consulta donde obtengamos el total de los registros que se quieren paginar.
* **$urlBase**: La url que montaremos en el paginador en el caso de estar en un controlador usaremos este patrón. Cambia el NAME_CONTROLLER por el nombre del controlador.
* **$paginator**: Aquí generamos la paginación y obtenemos el array con los parámetros necesarios para construir la paginación.

Pasamos los parámetros a nuestra plantilla de Smarty:

```
$this->context->smarty->assign(array(
                        'list_items'    => $paginator['result'],
                        'paginator'       => $paginator
                      ));
return $this->context->smarty->createTemplate(_PS_MODULE_DIR_.'name_of_your_module\views\templates\admin\/'. $tpl_name, $this->context->smarty);

```
Tenemos que enviar el conjunto de parámetros en este caso: *$paginator* y el nombre del parámetro se ha de llamar de forma obligatoria: **paginator**.

El resultado del listado lo tenemos en: **$paginator['result']**. En este caso lo pasamos separado o bien lo podemos recoger dentro de la plantilla.

Cómo utilizarlo en la plantilla:

En la plantilla siguiendo con este ejemplo, imprimimos los resultados que le pasamos por el parámetro *list_items* con un *{foreach}* y llamamos a la plantilla que imprimirá la paginación con un *include*.

Muestra de ejemplo en archivo.tpl :

```
{foreach from=$reports item=items_reports key=keys}
  {$reports.id} - {$reports.name} -{$reports.telefon}
{/foreach}

{include file="../../../vendor/did-web/paginator/views/templates/admin/pagination.tpl"}

```
