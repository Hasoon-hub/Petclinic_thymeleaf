<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cheapy" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet'>

<cheapy:layout pageName="nuOffer">

    <h2 style="text-align:center;padding:5px"><fmt:message key="nuOffer"/></h2>


    <table class="table table-striped" id="nuOffer-table">
        <tr>
            <th><fmt:message key="offerBeginning"/></th>
            <td><c:out value="${localDateTimeFormat.format(nuOffer.start)}"/></td>
        </tr>
        <tr>
            <th><fmt:message key="offerEnding"/></th>
            <td><c:out value="${localDateTimeFormat.format(nuOffer.end)}"/></td>
        </tr>
        <tr>
            <th><fmt:message key="goldGoal"/></th>
            <td><c:out value="${nuOffer.gold} comensales" /></td>
        </tr>
        <tr>
            <th><fmt:message key="goldDiscount"/></th>
            <td><c:out value="${nuOffer.discountGold}%"/></td>
        </tr>
        <tr>
            <th><fmt:message key="silverGoal"/></th>
            <td><c:out value="${nuOffer.silver} comensales"/></td>
        </tr>
        <tr>
            <th><fmt:message key="silverDiscount"/></th>
            <td><c:out value="${nuOffer.discountSilver}%"/></td>
        </tr>
        <tr>
            <th>Meta bronce</th>
            <td><c:out value="${nuOffer.bronze} comensales"/></td>
        </tr>
        <tr>
            <th><fmt:message key="bronzeDiscount"/></th>
            <td><c:out value="${nuOffer.discountBronze}%"/></td>
        </tr>
        <tr>
            <th><fmt:message key="offerCode"/></th>
            <td><c:out value="${nuOffer.code}"/></td>
        </tr>
    </table>

    <div class="btn-menu">
	    <div class="btn-return">
		    <button type="button" role="link" onclick="goBack()" style="font-family: 'Lobster'; font-size: 20px;">
		    <span class="glyphicon glyphicon-arrow-left" aria-hidden="true" style="padding: 5px"> </span>
		    <fmt:message key="return"/> </button>
	    </div>
	<sec:authorize access="hasAnyAuthority('client')">
		<div class="btns-edit">
		    <spring:url value="{nuOfferId}/edit" var="editUrl">
		    <spring:param name="nuOfferId" value="${nuOffer.id}"/>
		    </spring:url>
		    <button type="button" role="link" onclick="window.location='${fn:escapeXml(editUrl)}'" style="font-family: 'Lobster'; font-size: 20px;">
            <span class="glyphicon 	glyphicon glyphicon-edit" aria-hidden="true" style="padding: 5px"> </span>
	        Editar oferta</button>
			<c:if test="${nuOffer.status eq 'inactive' }">
		        <spring:url value="{nuOfferId}/activate" var="activateUrl">
		        <spring:param name="nuOfferId" value="${nuOffer.id}"/>
		        </spring:url>
		        <button type="button" role="link" onclick="window.location='${fn:escapeXml(activateUrl)}'" style="font-family: 'Lobster'; font-size: 20px;">
		            <span class="glyphicon 	glyphicon glyphicon-edit" aria-hidden="true" style="padding: 5px"> </span>
			        Activar oferta</button>
			</c:if>
			
			<c:if test="${nuOffer.status eq 'active' }">
				<spring:url value="{nuOfferId}/disable" var="deactivateUrl">
			    <spring:param name="nuOfferId" value="${nuOffer.id}"/>
			    </spring:url>
			    <button type="button" role="link" onclick="window.location='${fn:escapeXml(deactivateUrl)}'" style="font-family: 'Lobster'; font-size: 20px;">
		           <span class="glyphicon glyphicon glyphicon-trash" aria-hidden="true" style="padding: 5px"> </span>
			        Desactivar oferta</button>
		    </c:if>
	    </div>
    </div>
	</sec:authorize>
	<script>
		function goBack() {
		  window.history.back()
		}
	</script>

</cheapy:layout>
