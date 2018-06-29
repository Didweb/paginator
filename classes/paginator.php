<?php
/**
*  @author    Eduardo Pinuaga Linares Did-web.com <info@did-web.com>
*  @copyright did-web.com 2018
*  @license   GNU General Public License version 3
*  @version   1.0.0
*  Did-web.com
*
* Languages: EN
*
**/
namespace paginator\classes;

class Paginator
{
    public static function pagination($page, $consult, $n, $urlBase, $range)
    {
        $nb_reports = count($consult);
        $pages_nb = ceil($nb_reports / (int)$n);

        //  $range = 5; /* how many pages around page selected */
        $start = (int)($page - $range);
        if ($start < 1) {
            $start = 1;
        }
        $stop = (int)($page + $range);
        if ($stop > $pages_nb) {
            $stop = (int)$pages_nb;
        }

        if (!$page) {
            $page = 1;
        }

        $cutConsult = array_slice($consult, (((int)$page - 1) * (int)$n), (int)$n);

        $parameters = array('urlBase'  => $urlBase,
                            'pages_nb' => $pages_nb,
                            'prev_p'   => $page != 1 ? $page - 1 : 1,
                            'next_p'   => (int)$page + 1  > $pages_nb ? $pages_nb : $page + 1,
                            'p'        => $page,
                            'n'        => $n,
                            'range'    => $range,
                            'start'    => $start,
                            'stop'     => $stop,
                            'result'   => $cutConsult);
        return $parameters;
    }
}
