<#macro pager url page>
<#assign totalPages = page.getTotalPages()>
<#assign pageNumber = page.getNumber() + 1>
    <#if totalPages gt 9>
        <#if pageNumber lt 6>
            <#assign body = [1, 2, 3, 4, 5, 6, 7, -1, totalPages]>
        <#elseif pageNumber gt totalPages - 5 >
            <#assign body = [1, -1, totalPages-6, totalPages-5, totalPages-4, totalPages-3, totalPages-2, totalPages-1, totalPages]>
        <#else>
            <#assign body = [1, -1, pageNumber-2, pageNumber-1, pageNumber, pageNumber+1, pageNumber+2, -1, totalPages]>
        </#if>
    <#elseif totalPages = 0>
        <#assign body = [1]>
    <#else>
        <#assign body = 1..totalPages>
    </#if>
    <div class="container mt-3">
        <div class="row">
            <ul class="pagination col justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Страницы</a>
                </li>
            <#list body as p>
                <#if (p - 1) == page.getNumber()>
                    <li class="page-item active">
                        <a class="page-link" href="#" tabindex="-1">${p}</a>
                    </li>
                <#elseif p == -1>
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">...</a>
                    </li>
                <#else>
                    <li class="page-item">
                        <a class="page-link" href="${url}?page=${p - 1}&size=${page.getSize()}" tabindex="-1">${p}</a>
                    </li>
                </#if>
            </#list>
            </ul>

            <ul class="pagination col justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Элементов на странице</a>
                </li>
            <#list [5, 10, 25, 50] as c>
                <#if c == page.getSize()>
                    <li class="page-item active">
                        <a class="page-link" href="#" tabindex="-1">${c}</a>
                    </li>
                <#else>
                    <li class="page-item">
                        <a class="page-link" href="${url}?page=${page.getNumber()}&size=${c}" tabindex="-1">${c}</a>
                    </li>
                </#if>
            </#list>
            </ul>
        </div>
    </div>
</#macro>