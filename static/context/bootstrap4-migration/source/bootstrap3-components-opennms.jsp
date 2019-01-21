<%@page language="java" contentType="text/html" session="true"  %>
<%--
/*******************************************************************************
 * This file is part of OpenNMS(R).
 *
 * Copyright (C) 2002-2017 The OpenNMS Group, Inc.
 * OpenNMS(R) is Copyright (C) 1999-2017 The OpenNMS Group, Inc.
 *
 * OpenNMS(R) is a registered trademark of The OpenNMS Group, Inc.
 *
 * OpenNMS(R) is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published
 * by the Free Software Foundation, either version 3 of the License,
 * or (at your option) any later version.
 *
 * OpenNMS(R) is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with OpenNMS(R).  If not, see:
 *      http://www.gnu.org/licenses/
 *
 * For more information contact:
 *     OpenNMS(R) Licensing <license@opennms.org>
 *     http://www.opennms.org/
 *     http://www.opennms.com/
 *******************************************************************************/

--%>

<%-- copied from includes/bootstrap.jsp --%>
<%@page language="java"
        contentType="text/html"
        session="true"
        import="
		org.opennms.core.utils.TimeSeries,
		org.opennms.web.api.Util,
		org.opennms.netmgt.config.NotifdConfigFactory
	"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    final String baseHref = Util.calculateUrlBase( request );
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Bootstrap all elements</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Style-Type" content="text/css"/>
    <meta http-equiv="Content-Script-Type" content="text/javascript"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <meta name="apple-itunes-app" content="app-id=968875097">

    <!-- Set GWT property to get browsers locale -->
    <meta name="gwt:property" content="locale=<%=request.getLocale()%>">

    <c:forEach var="meta" items="${paramValues.meta}">
        <c:out value="${meta}" escapeXml="false"/>
    </c:forEach>

    <jsp:include page="/assets/load-assets.jsp" flush="false">
        <jsp:param name="asset" value="manifest" />
        <jsp:param name="asset-type" value="js" />
    </jsp:include>

    <!--  ${nostyles} -->
    <c:if test="${param.nostyles != 'true' }">
        <jsp:include page="/assets/load-assets.jsp" flush="false">
            <jsp:param name="asset" value="bootstrap" />
            <jsp:param name="asset-media" value="screen" />
            <jsp:param name="asset-type" value="css" />
        </jsp:include>
        <jsp:include page="/assets/load-assets.jsp" flush="false">
            <jsp:param name="asset" value="opennms-theme" />
            <jsp:param name="asset-media" value="screen" />
            <jsp:param name="asset-type" value="css" />
        </jsp:include>
        <jsp:include page="/assets/load-assets.jsp" flush="false">
            <jsp:param name="asset" value="font-awesome" />
            <jsp:param name="asset-type" value="css" />
        </jsp:include>
        <!-- we used to include the "print.css" here but it turns out it looks like crap -->
    </c:if>
    <link rel="shortcut icon" href="<%= baseHref %>favicon.ico" />
    <link rel="apple-touch-icon" sizes="180x180" href="<%= baseHref %>apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="<%= baseHref %>favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="<%= baseHref %>favicon-16x16.png">
    <link rel="manifest" href="<%= baseHref %>site.webmanifest">
    <link rel="mask-icon" href="<%= baseHref %>safari-pinned-tab.svg" color="#4c9d45">
    <meta name="msapplication-TileColor" content="#e9e9e9">
    <meta name="theme-color" content="#ffffff">
    <c:forEach var="link" items="${paramValues.link}">
        <c:out value="${link}" escapeXml="false" />
    </c:forEach>

    <jsp:include page="/assets/load-assets.jsp" flush="false">
        <jsp:param name="asset" value="vendor" />
    </jsp:include>
    <jsp:include page="/assets/load-assets.jsp" flush="false">
        <jsp:param name="asset" value="global" />
    </jsp:include>

    <c:if test="${param.storageAdmin == 'true'}">
        <jsp:include page="/assets/load-assets.jsp" flush="false">
            <jsp:param name="asset" value="rws-storage" />
        </jsp:include>
    </c:if>

    <c:if test="${param.useionicons == 'true'}">
        <jsp:include page="/assets/load-assets.jsp" flush="false">
            <jsp:param name="asset" value="ionicons-css" />
        </jsp:include>
    </c:if>
</head>
<body>

<style type="text/css">
    .mt-2 {
        margin-top: 0.75em;
    }
    .mt-3 {
        margin-top: 1.125em;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-default bg-primary">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Navbar</a>
        </div>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a class="" href="#!">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="">
                    <a class="" href="#!">Link</a>
                </li>
                <li class="">
                    <a class="disabled" href="#!">Disabled</a>
                </li>
            </ul>
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row mt-3">
        <div class="col-md-3 col-sm-6">

            <!--Body text-->
            <p>Hello. I'm a little bit of body text. Plain and simple.</p>

            <!--Badges-->
            <span class="label label-default">Default</span>
            <span class="label label-primary">Primary</span>
            <span class="label label-success">Success</span>
            <span class="label label-danger">Danger</span>
            <span class="label label-warning">Warning</span>
            <span class="label label-info">Info</span>

            <!--Breadcrumb-->
            <nav aria-label="breadcrumb" role="navigation">
                <ol class="breadcrumb mt-2">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Library</a></li>
                    <li class="active">Data</li>
                </ol>
            </nav>

            <!--Buttons-->
            <div>
                <button type="button" class="btn btn-default">Default</button>
                <button type="button" class="btn btn-primary">Primary</button>
                <button type="button" class="btn btn-success">Success</button>
                <button type="button" class="btn btn-danger">Danger</button>
                <button type="button" class="btn btn-warning">Warning</button>
                <button type="button" class="btn btn-info">Info</button>
            </div>

            <!--Checkbox buttons-->
            <div class="mt-3">
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-default active">
                        <input type="checkbox" checked autocomplete="off"> Yes
                    </label>
                    <label class="btn btn-default">
                        <input type="checkbox" autocomplete="off"> No
                    </label>
                </div>
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-primary active">
                        <input type="checkbox" checked autocomplete="off"> Yes
                    </label>
                    <label class="btn btn-primary">
                        <input type="checkbox" autocomplete="off"> No
                    </label>
                </div>
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-success active">
                        <input type="checkbox" checked autocomplete="off"> Yes
                    </label>
                    <label class="btn btn-success">
                        <input type="checkbox" autocomplete="off"> No
                    </label>
                </div>
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-danger active">
                        <input type="checkbox" checked autocomplete="off"> Yes
                    </label>
                    <label class="btn btn-danger">
                        <input type="checkbox" autocomplete="off"> No
                    </label>
                </div>
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-warning active">
                        <input type="checkbox" checked autocomplete="off"> Yes
                    </label>
                    <label class="btn btn-warning">
                        <input type="checkbox" autocomplete="off"> No
                    </label>
                </div>
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-info active">
                        <input type="checkbox" checked autocomplete="off"> Yes
                    </label>
                    <label class="btn btn-info">
                        <input type="checkbox" autocomplete="off"> No
                    </label>
                </div>
            </div>

            <!--Dropdown buttons-->
            <div class="mt-3">
                <div class="btn-group">
                    <button type="button" class="btn btn-default">Default</button>
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </div> <!-- /btn-group -->
                <div class="btn-group">
                    <button type="button" class="btn btn-primary">Primary</button>
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </div> <!-- /btn-group -->
                <div class="btn-group">
                    <button type="button" class="btn btn-success">Success</button>
                    <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </div> <!-- /btn-group -->
            </div>
            <div class="mt-2">
                <div class="btn-group">
                    <button type="button" class="btn btn-info">Info</button>
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </div> <!-- /btn-group -->
                <div class="btn-group">
                    <button type="button" class="btn btn-warning">Warning</button>
                    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </div> <!-- /btn-group -->
                <div class="btn-group">
                    <button type="button" class="btn btn-danger">Danger</button>
                    <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </div> <!-- /btn-group -->

            </div>


            <!--Forms-->
            <div class="mt-3">
                <form>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Form label</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter">
                        <small id="emailHelp" class="help-block">Form Text - To give hints and things</small>
                    </div>
                </form>

            </div>

            <div class="mt-2">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value=""> Custom Check
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked> Custom radio
                    </label>
                    <label>
                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2" checked> Custom radio 2
                    </label>
                </div>
            </div>
            <div class="mt-2">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                    <label class="custom-control-label" for="customCheck1">Custom check</label>
                </div>
                <div class="custom-control custom-radio">
                    <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input">
                    <label class="custom-control-label" for="customRadio1">Custom radio</label>
                </div>
                <select class="form-control">
                    <option selected>Custom select menu</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
            </div>

            <div class="mt-2">
                <label class="custom-file">
                    <input type="file" id="file" class="custom-file-input">
                    <span class="custom-file-control"></span>
                </label>
            </div>


            <!--Pagination-->
            <div class="mt-2">
                <nav aria-label="...">
                    <ul class="pagination">
                        <li class="page-item disabled">
                            <span class="page-link">Previous</span>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#!">1</a>
                        </li>
                        <li class="page-item active">
              <span class="page-link">
                2
                <span class="sr-only">(current)</span>
              </span>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#!">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#!">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="mt-2">

                <div class="progress">
                    <div class="progress-bar progress-bar-primary" role="progressbar"
                         style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    <div class="progress-bar progress-bar-success" role="progressbar"
                         style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    <div class="progress-bar progress-bar-info" role="progressbar"
                         style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    <div class="progress-bar progress-bar-warning" role="progressbar"
                         style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    <div class="progress-bar progress-bar-danger" role="progressbar"
                         style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                </div>

                <div class="progress mt-2">
                    <div class="progress-bar progress-bar-striped progress-bar-primary" role="progressbar"
                         style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    <div class="progress-bar progress-bar-striped progress-bar-success" role="progressbar"
                         style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    <div class="progress-bar progress-bar-striped progress-bar-info" role="progressbar"
                         style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    <div class="progress-bar progress-bar-striped progress-bar-warning" role="progressbar"
                         style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    <div class="progress-bar progress-bar-striped progress-bar-danger" role="progressbar"
                         style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                </div>

            </div>


        </div>

        <div class="col-md-3 col-sm-6">

            <!--Alerts-->
            <div class="mb-2 alert alert-success" role="alert">
                This is a success alert with <a href="#" class="alert-link">an example link</a>.
            </div>
            <div class="mb-2 alert alert-danger" role="alert">
                This is a danger alert with <a href="#" class="alert-link">an example link</a>.
            </div>
            <div class="mb-2 alert alert-warning" role="alert">
                This is a warning alert with <a href="#" class="alert-link">an example link</a>.
            </div>
            <div class="mb-2 alert alert-info" role="alert">
                This is a info alert with <a href="#" class="alert-link">an example link</a>.
            </div>


            <div class="mt-2">
                <ul class="list-group">
                    <li class="list-group-item list-group-item-success">Dapibus ac facilisis in</li>
                    <li class="list-group-item list-group-item-danger">Porta ac consectetur ac</li>
                    <li class="list-group-item list-group-item-warning">Vestibulum at eros</li>
                    <li class="list-group-item list-group-item-info">Cras justo odio</li>
                </ul>
            </div>
        </div>

        <!--Panels-->
        <div class="col-md-6 mt-lg-0 mt-4" >
            <div class="row">
                <div class="col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Panel title</h3>
                        </div>
                        <div class="panel-body">
                            Some quick example text to build on the panel title and make up the
                            bulk of the panels's content.
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Panel title</h3>
                        </div>
                        <div class="panel-body">
                            Some quick example text to build on the panel title and make up the
                            bulk of the panels's content.
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">Panel title</h3>
                        </div>
                        <div class="panel-body">
                            Some quick example text to build on the panel title and make up the
                            bulk of the panels's content.
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h3 class="panel-title">Panel title</h3>
                        </div>
                        <div class="panel-body">
                            Some quick example text to build on the panel title and make up the
                            bulk of the panels's content.
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <h3 class="panel-title">Panel title</h3>
                        </div>
                        <div class="panel-body">
                            Some quick example text to build on the panel title and make up the
                            bulk of the panels's content.
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">Panel title</h3>
                        </div>
                        <div class="panel-body">
                            Some quick example text to build on the panel title and make up the
                            bulk of the panels's content.
                        </div>
                    </div>
                </div>

            </div>

            <div>

                <table class="table table-hover table-striped table-">
                    <thead class="bg-primary">
                    <tr>
                        <th>#</th>
                        <th>Column</th>
                        <th>Column</th>
                        <th>Column</th>
                        <th>Column</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td class="default">Content</td>
                        <td class="bg-primary">Content</td>
                        <td class="default">Content</td>
                        <td class="bg-primary">Content</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td class="warning">Content</td>
                        <td class="info">Content</td>
                        <td class="success">Content</td>
                        <td class="danger">Content</td>
                    </tr>

                    <tr class="success">
                        <th scope="row">1</th>
                        <td class="">Content</td>
                        <td class="">Content</td>
                        <td class="">Content</td>
                        <td class="">Content</td>
                    </tr>
                    <tr class="warning">
                        <th scope="row">2</th>
                        <td class="">Content</td>
                        <td class="">Content</td>
                        <td class="">Content</td>
                        <td class="">Content</td>
                    </tr>
                    <tr class="info">
                        <th scope="row">2</th>
                        <td class="">Content</td>
                        <td class="">Content</td>
                        <td class="">Content</td>
                        <td class="">Content</td>
                    </tr>
                    <tr class="danger">
                        <th scope="row">2</th>
                        <td class="">Content</td>
                        <td class="">Content</td>
                        <td class="">Content</td>
                        <td class="">Content</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>