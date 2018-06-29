
# Paginator :gb:
Pager for listings in Prestashop.

### Objective
It is a bit of code to be able to create pages in the Prestashop Administration modules.

### Example of Use
Our code must be able to generate a parameter that contains the page number. In this example it is called "page".

*Example of use*:

With this code we initialize the pagination creation process and obtain an array with parameters.

```
$page = Tools::getValue('page');
$consult = $this->repositories->listReports2();
$urlBase = "index.php?controller=NAME_CONTROLLER"
                     ."&token=".Tools::getValue('token');
$paginator = Paginator::pagination($page, $consult, 20, $urlBase, 5);

```
Explanation of this code:

* **$page**: we collect the GET parameter where the page number is stored.
* **$consult**: It is the query we must make a query where we get the total of the records that we want to paginate.
* **$urlBase**: The url that we will mount in the pager in the case of being in a controller we will use this pattern. Change the NAME_CONTROLLER to the name of the controller.
* **$paginator**: Here we generate the pagination and obtain the array with the necessary parameters to build the pagination.
  * **$page**: It is the previously mentioned.
  * **$consult**: It is the aforementioned.
  * **20**: It must be a numerical value that we will indicate the number of records per page.
  * **$urlBase**: It is the aforementioned.
  * **5**: It must be a numeric value. With which we will indicate the range of pages that will be seen in the links of the page.

We pass the parameters to our Smarty template:

```
$this->context->smarty->assign(array(
                        'list_items' => $paginator['result'],
                        'paginator'  => $paginator
                      ));
return $this->context->smarty->createTemplate(_PS_MODULE_DIR_.'name_of_your_module\views\templates\admin\/'. $tpl_name, $this->context->smarty);

```

We have to send the set of parameters in this case: *$ paginator* and the name of the parameter must be called as required: **paginator**.

The result of the listing is in: **$paginator ['result']**. In this case we pass it separately or we can collect it within the template.

How to use it in the template:

In the template following with this example, we print the results that we passed to it by the parameter *list_items* with a *{foreach}* and call the template that will print the page with an *include*.

Sample sample in file.tpl:

```
{foreach from=$reports item=items_reports key=keys}
  {$reports.id} - {$reports.name} -{$reports.telefon}
{/foreach}
...
{include file="../../../vendor/did-web/paginator/views/templates/admin/pagination.tpl"}

```

### Installation
To be able to install it, a composer.json file is created like this:

```
{
    "name": "did-web/name_of_your_module",
    "description": "text",
    "type": "Prestashop Module",
    "authors": [
        {
            "name": "Your Name",
            "email": "your@mail.com",
            "homepage": "www.your-website.com",
            "role": "Developer"
        }
    ],
    "require": {
      "did-web/paginator": "dev-master"
    }
}
```

The important part of the example is the *require*:
**did-web / paginator ":" dev-master "**

To run it manually from your console:

```
composer install
```
----

# Paginator :de:
Pager für Einträge in Prestashop.

### Ziel
Es ist ein wenig Code, um Seiten in den Prestashop-Administrationsmodulen erstellen zu können.

### Anwendungsbeispiel
Unser Code muss in der Lage sein, einen Parameter zu generieren, der die Seitennummer enthält. In diesem Beispiel heißt es "page".


*Anwendungsbeispiel:*

Mit diesem Code initialisieren wir den Paginierungserstellungsprozess und erhalten ein Array mit Parametern.

```
$page = Tools::getValue('page');
$consult = $this->repositories->listReports2();
$urlBase = "index.php?controller=NAME_CONTROLLER"
                     ."&token=".Tools::getValue('token');
$paginator = Paginator::pagination($page, $consult, 20, $urlBase, 5);

```
Erklärung dieses Codes:

* **$page**: Wir sammeln den GET-Parameter, in dem die Seitenzahl gespeichert ist.
* **$consult**: Es ist die Abfrage, dass wir eine Abfrage machen müssen, wo wir die Summe der Datensätze erhalten, die wir paginieren wollen.
* **$urlBase**: Die URL, die wir im Pager einbinden werden, wenn wir in einem Controller sind, werden wir dieses Muster verwenden. Ändern Sie den NAME_CONTROLLER in den Namen des Controllers.
* **$paginator**: Hier erzeugen wir die Paginierung und erhalten das Array mit den notwendigen Parametern, um die Paginierung zu erstellen.
  * **$page**: Es ist das vorher erwähnte.
  * **$consult**: Es ist das bereits erwähnte.
  * **20**: Es muss ein numerischer Wert sein, dass wir die Anzahl der Datensätze pro Seite angeben.
  * **$urlBase**: Es ist das bereits erwähnte.
  * **5**: Es muss ein numerischer Wert sein. Damit geben wir den Umfang der Seiten an, die in den Links der Seite zu sehen sind.

Wir übergeben die Parameter an unsere Smarty-Vorlage:

```
$this->context->smarty->assign(array(
                        'list_items' => $paginator['result'],
                        'paginator'  => $paginator
                      ));
return $this->context->smarty->createTemplate(_PS_MODULE_DIR_.'name_of_your_module\views\templates\admin\/'. $tpl_name, $this->context->smarty);

```

Wir müssen in diesem Fall den Parametersatz senden: *$paginator* und der Name des Parameters muss wie erforderlich aufgerufen werden: **paginator**.

Das Ergebnis der Auflistung ist: **$paginator ['result']**. In diesem Fall übergeben wir es separat oder wir können es innerhalb der Vorlage sammeln.

Wie man es in der Vorlage verwendet:

In der Vorlage, die diesem Beispiel folgt, drucken wir die Ergebnisse, die wir an den Parameter *list_items* übergeben haben, mit einem *{foreach}* und rufen die Vorlage auf, die die Seite mit einem *include* druckt.

Beispielbeispiel in file.tpl:

```
{foreach from=$reports item=items_reports key=keys}
  {$reports.id} - {$reports.name} -{$reports.telefon}
{/foreach}
...
{include file="../../../vendor/did-web/paginator/views/templates/admin/pagination.tpl"}

```

### Installation
Um es zu installieren, wird eine composer.json-Datei wie folgt erstellt:

```
{
    "name": "did-web/name_of_your_module",
    "description": "text",
    "type": "Prestashop Module",
    "authors": [
        {
            "name": "Your Name",
            "email": "your@mail.com",
            "homepage": "www.your-website.com",
            "role": "Developer"
        }
    ],
    "require": {
      "did-web/paginator": "dev-master"
    }
}
```

Der wichtige Teil des Beispiels ist das *require*:
**did-web / paginator ":" dev-master "**

Um es manuell von Ihrer Konsole aus zu starten:
```
composer install
```

----

# Paginator :es:
Paginador para listados en Prestashop.

### Objetivo
Es un poco de código para poder crear paginaciones en los módulos de Administración de Prestashop.

### Ejemplo de Uso
Nuestro código ha de poder generar un parámetro que contenga el número de página. En este ejemplo se llama "page".

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
  * **page**: Es el anteriormente mencionado.
  * **$consult**: Es el anteriormente mencionado.
  * **20**: Ha de ser un valor númerico que indicaremos el número de registros por pagina.
  * **$urlBase**: Es el anteriormente mencionado.
  * **5**: Ha de ser un valor númerico.  Con el que indicaremos el rango de paginas en que se verán en los links de la paginación.

Pasamos los parámetros a nuestra plantilla de Smarty:

```
$this->context->smarty->assign(array(
                        'list_items' => $paginator['result'],
                        'paginator'  => $paginator
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
...
{include file="../../../vendor/did-web/paginator/views/templates/admin/pagination.tpl"}

```

### Instalación
Para poder instalarlo se crea un archivo composer.json como este:

```
{
    "name": "did-web/name_of_your_module",
    "description": "text",
    "type": "Prestashop Module",
    "authors": [
        {
            "name": "Your Name",
            "email": "your@mail.com",
            "homepage": "www.your-website.com",
            "role": "Developer"
        }
    ],
    "require": {
      "did-web/paginator": "dev-master"
    }
}
```

La parte importante del ejemplo es el *require*:
**did-web/paginator": "dev-master"**

Para ejecutarlo de forma manual desde tu consola:
```
composer install
```
