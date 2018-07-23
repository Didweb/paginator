<nav aria-label="pag">
{if $paginator.start != $paginator.stop}
    <ul class="pagination">
        {if $paginator.p != 1 && $paginator.p}
            {assign var='p_previous' value=$paginator.p-1}

            <li id="pagination_previous{if isset($paginationId)}_{$paginationId|escape:'htmlall':'UTF-8'}{/if}" class="pagination_previous">
                <a rel="nofollow" href="{$paginator.urlBase|escape:'htmlall':'UTF-8'}&page={$paginator.prev_p|escape:'htmlall':'UTF-8'}">
                    <i class="icon-chevron-left"></i> <b>{$paginator.txt_paginator['Previous']|escape:'htmlall':'UTF-8'}</b>
                </a>
            </li>
        {else}
            <li id="pagination_previous{if isset($paginationId)}_{$paginationId|escape:'htmlall':'UTF-8'}{/if}" class="disabled pagination_previous">
                <span>
                    <i class="icon-chevron-left"></i> <b>{$paginator.txt_paginator['Previous']|escape:'htmlall':'UTF-8'}</b>

                </span>
            </li>
        {/if}
        {if $paginator.start==3}
            <li>
                <a rel="nofollow"  href="{$link->goPage($paginator.urlBase|escape:'htmlall':'UTF-8', 1)}">
                    <span>1</span>
                </a>
            </li>
            <li>
                <a rel="nofollow"  href="{$link->goPage($paginator.urlBase|escape:'htmlall':'UTF-8', 2)}">
                    <span>2</span>
                </a>
            </li>
        {/if}
        {if $paginator.start==2}
            <li>
                <a rel="nofollow"  href="{$link->goPage($paginator.urlBase|escape:'htmlall':'UTF-8', 1)}">
                    <span>1</span>
                </a>
            </li>
        {/if}
        {if $paginator.start>3}
            <li>
                <a rel="nofollow"  href="{$link->goPage($paginator.urlBase|escape:'htmlall':'UTF-8', 1)}">
                    <span>1</span>
                </a>
            </li>
            <li class="truncate">
                <span>
                    <span>...</span>
                </span>
            </li>
        {/if}
        {section name=pagination start=$paginator.start loop=$paginator.stop+1 step=1}
            {if $paginator.p == $smarty.section.pagination.index}
                <li class="active current">
                    <span>
                        <span>{$paginator.p|escape:'html':'UTF-8'}</span>
                    </span>
                </li>
            {else}
                <li>
                    <a rel="nofollow" href="{$paginator.urlBase|escape:'htmlall':'UTF-8'}&page={$smarty.section.pagination.index|escape:'htmlall':'UTF-8'}">
                        <span>{$smarty.section.pagination.index|escape:'html':'UTF-8'}</span>
                    </a>
                </li>
            {/if}
        {/section}
        {if $paginator.pages_nb > $paginator.stop+2}
            <li class="truncate">
                <span>
                    <span>...</span>
                </span>
            </li>
            <li>
                <a href="{$paginator.urlBase|escape:'htmlall':'UTF-8'}&page={$paginator.pages_nb|escape:'htmlall':'UTF-8'}">
                    <span>{$paginator.pages_nb|intval}</span>
                </a>
            </li>
        {/if}
        {if $paginator.pages_nb==$paginator.stop+1}
            <li>
                <a href="{$paginator.urlBase|escape:'htmlall':'UTF-8'}&page={$paginator.pages_nb|escape:'htmlall':'UTF-8'}">
                    <span>{$paginator.pages_nb|intval}</span>
                </a>
            </li>
        {/if}
        {if $paginator.pages_nb==$paginator.stop+2}
            <li>
                <a href="{$paginator.urlBase|escape:'htmlall':'UTF-8'}&page={$paginator.pages_nb-1|escape:'htmlall':'UTF-8'}">
                    <span>{$paginator.pages_nb-1|intval}</span>
                </a>
            </li>
            <li>
                <a href="{$paginator.urlBase|escape:'htmlall':'UTF-8'}&page={$paginator.pages_nb|escape:'htmlall':'UTF-8'}">
                    <span>{$paginator.pages_nb|intval}</span>
                </a>
            </li>
        {/if}
        {if $paginator.pages_nb > 1 AND $paginator.p != $paginator.pages_nb}
            {assign var='p_next' value=$paginator.p+1}
            <li id="pagination_next{if isset($paginationId)}_{$paginationId|escape:'htmlall':'UTF-8'}{/if}" class="pagination_next">
                <a rel="nofollow" href="{$paginator.urlBase|escape:'htmlall':'UTF-8'}&page={$paginator.next_p|escape:'htmlall':'UTF-8'}">
                    <b>{$paginator.txt_paginator['Next']|escape:'htmlall':'UTF-8'}</b> <i class="icon-chevron-right"></i>
                </a>
            </li>
        {else}
            <li id="pagination_next{if isset($paginationId)}_{$paginationId|escape:'htmlall':'UTF-8'}{/if}" class="disabled pagination_next">
                <span>
                    <b>{$paginator.txt_paginator['Next']|escape:'htmlall':'UTF-8'}</b> <i class="icon-chevron-right"></i>
                </span>
            </li>
        {/if}
    </ul>
{/if}
</nav>
