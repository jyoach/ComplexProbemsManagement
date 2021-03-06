<%@ include file = "taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Complex Problem Management - Admin Space</title>
		<%@ include file = "assets.jsp" %>
	</head>
	<body class="whiteBody">
		
		<%@ include file = "menu.jsp" %>
		
		<div class="centeredDiv">
			<div class="rightDiv"></div>
			<div class="leftDiv">
		
				<div class="divReplyTitle" style="margin-top:40px; ">
					<h2>Sous Probl�me <c:if test="${archive==true }">archiv�</c:if> s�lectionn� </h2>
				</div>
				
				<div class="reply">
					 <div class="reply-content">
						<!-- Header -->
						<div class="reply-header">
							<p class="left" style="font-size: 25px; color: white; font-weight: bold;">${spr.titleSPr}</p>
							<p class="right">Added By <strong>${spr.user.getLastName()} ${spr.user.getFirstName()} - ${spr.dateSPr} - # ${spr.idSPr}</strong></p>
						</div>
						
						<!-- Body -->
						<div class="reply-body">
							<div class="right-div">
								<p>${spr.bodySPr}</p>
							</div>
						</div>
						
					</div>
				</div>
				
				<c:if test="${archive==false }">
					<!-- ----------------------------------------------------Ajouter une solution----------------------------------------------------->
					<div class="divReplyTitle">
						<p style="margin:0; padding:0; margin-bottom: 5px;">
							<span style="font-size: 25px;color: black;font-weight: bold;color: #80bfff;">Ajouter une r�ponse</span> 
							<span style="float: right; margin-right: 10px; cursor: pointer;"><i id="icon" class="fa fa-sort-desc" style="color:#80bfff; font-size:25px; margin:0; padding:0; " onclick="showForm()"></i></span> 
						</p>
					</div>
					<form id="form" action="saveRepSPr" method="post" style="display: none;">		
						<input type="hidden" name="idPr" id="idPr" value="${spr.problem.getIdPr() }">
						<input type="hidden" name="idSPr" id="idSPr" value="${spr.getIdSPr() }">
						<textarea rows="5" name="contentRep" id="contentRep" tabindex="1" class="form-control" style="height: 50px; margin-top:5px;" placeholder="Description de la r�ponse.." required="required"></textarea>
						<button class="btn" type="submit">Ajouter</button>
					</form>
				</c:if>
				
				<br>
				
				<!-- ----------------------------------------------------Solution---------------------------------------------------- -->
				<div class="divReplyTitle">
					<h2> ${nbrSolutions }  R�ponses </h2>
				</div>
				
				<!-- Afficher les solutions first -->
				<c:forEach items="${solutions}" var="rep">
					<div class="reply">
						<div class="reply-content">
							<!-- Header -->
							<div class="reply-header">
								<p class="left"><span class="sproblemtitle"><strong>${rep.sproblem.titleSPr }</strong></span> - answered ${rep.dateRep}</p>
								<p class="right">Added By <strong>${rep.user.getFirstName()} ${rep.user.getLastName()}</strong></p>
							</div>
							
							<!-- Body -->
							<div class="reply-body">
								<div class="left-div">
									<i class="fa fa-check" style="font-size:48px;color:lightgreen"></i>
								</div>
								<div class="right-div">
									<p>${rep.contentRep}</p>
								</div>
							</div>
							
							<!-- Footer -->
							<c:if test="${archive==false }">
								<div class="reply-footer">
									<p class="right">
										<a href="deleteRepProblem?idRep=${rep.idRep }" ><i class="material-icons">delete</i></a>
									<p>
								</div>
							</c:if>
								
						</div>
					</div>
				</c:forEach>
				<c:forEach items="${replies}" var="rep">
					<div class="reply">
						<div class="reply-content">
							<!-- Header -->
							<div class="reply-header">
								<c:choose>
									<c:when test="${rep.sproblem.idSPr == null }"><p class="left">answered ${rep.dateRep}</p></c:when>
									<c:otherwise><p class="left"><span class="sproblemtitle"><strong>${rep.sproblem.titleSPr }</strong></span> - answered ${rep.dateRep}</p></c:otherwise>
								</c:choose>
								<p class="right">Added By <strong>${rep.user.getFirstName()} ${rep.user.getLastName()}</strong></p>
							</div>
							
							<!-- Body -->
							<div class="reply-body">
								<div class="left-div">
								</div>
								<div class="right-div">
									<p>${rep.contentRep}</p>
								</div>
							</div>
							
							<!-- Footer -->
							<c:if test="${archive==false }">
								<div class="reply-footer" style="border-top: 1px solid #80bfff">
									<p class="left" style="color: #80bfff; padding-left: 10px; ">Selectionner comme
										<a style="font-size: 15px;" href="selectSolutionSProb?idRep=${rep.idRep }"> "Solution"</a>
									</p>
									<p class="right">
										<a href="deleteRepSProblem?idRep=${rep.idRep }" ><i class="material-icons">delete</i></a>
									<p>
								</div>
							</c:if>
							
						</div>
					</div>
				</c:forEach>
				
			</div>
		</div>
		
		<!-- Script for form show/hide -->
		<script>
			function showForm() {
			    var x = document.getElementById("form");
			    var ic = document.getElementById("icon");
			    if (x.style.display === "none") {
			    	ic.className = "fa fa-sort-asc";
			        x.style.display = "block";
			    } else {
			    	ic.className = "fa fa-sort-desc";
			        x.style.display = "none";
			    }
			}
		</script>
		
	</body>
</html>