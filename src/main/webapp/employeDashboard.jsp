<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employer DashBoard<%=application.getAttribute("appName") %></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="includes/header.jsp" %>
<%
	
	String userId=(String)session.getAttribute("userId");
	if(userId==null){
		response.sendRedirect("login.jsp");
		return ;
	}

%>

 <main class="container py-5">
      <h2 class="mb-4">Welcome, Dheeraj Lowanshi 😊</h2>
      <div class="p-4 mb-4 job-form-card">
        <h5>Post a new job</h5>
        <form action="#" method="post">
          <div class="mb-3">
            <input
              type="text"
              class="form-control"
              placeholder="Job Title"
              name="title"
              required
            />
          </div>
          <div class="mb-3">
            <textarea
              name="description"
              type="text"
              class="form-control"
              placeholder="Job Description"
              required
            ></textarea>
          </div>
          <div class="mb-3">
            <input
              type="text"
              class="form-control"
              placeholder="Required Skills (comma separated)"
              name="skills"
              required
            />
          </div>
          <div class="mb-3">
            <input
              type="text"
              class="form-control"
              placeholder="Company Name"
              name="Company"
              required
            />
          </div>
          <div class="mb-3">
            <select name="location" class="form-select">
              <option value="" disabled selected>Select a Location</option>
              <option value="mumbai">Mumbai</option>
              <option value="delhi">Delhi</option>
              <option value="bangalore">Bangalore</option>
              <option value="hyderabad">Hyderabad</option>
              <option value="kolkata">Kolkata</option>
              <option value="chennai">Chennai</option>
              <option value="pune">Pune</option>
              <option value="ahmedabad">Ahmedabad</option>
              <option value="surat">Surat</option>
              <option value="vadodara">Vadodara</option>
              <option value="kochi">Kochi</option>
              <option value="coimbatore">Coimbatore</option>
            </select>
          </div>
          <div class="mb-3">
            <select name="experience" class="form-select">
              <option value="" disabled selected>Select Experience</option>
              <option value="0-1">0-1</option>
              <option value="1-2">1-2</option>
              <option value="2-3">2-3</option>
              <option value="3-4">3-4</option>
              <option value="4-5">4-5</option>
              <option value="5-6">5-6</option>
              <option value="6-7">6-7</option>
              <option value="7-8">7-8</option>
              <option value="8-9">8-9</option>
              <option value="10+">10+</option>
            </select>
          </div>
          <div class="mb-3">
            <select name="packageLpa" class="form-select">
              <option value="" disabled selected>Select Salary</option>
              <option value="1-3 lpa">1-3 LPA</option>
              <option value="3-5 lpa">3-5 LPA</option>
              <option value="5-7 lpa">5-7 LPA</option>
              <option value="7-10 lpa">7-10 LPA</option>
              <option value="10+ lpa">10+ LPA</option>
            </select>
          </div>
          <div class="mb-3">
            <input
              type="number"
              name="vacancy"
              placeholder="Vacancy"
              class="form-control"
              min="0"
              required
            />
          </div>
          <button type="submit" class="btn btn-login">Post Job</button>
        </form>
      </div>

      <!-- search and filter jobs start -->
      <form action="#" method="post">
        <div class="row g-2 mb-4">
          <div class="col-md-4">
            <input
              type="text"
              name="search"
              class="form-control"
              placeholder="Search by title"
              required
            />
          </div>
          <div class="col-md-3">
            <select name="status" class="form-select">
              <option value="" disabled selected>Select Status</option>
              <option value="active">Active</option>
              <option value="inactive">Inactive</option>
            </select>
          </div>
          <div class="col-md-3">
            <select name="sort" class="form-select">
              <option value="" disabled selected>Sort by Applicant</option>
              <option value="asc">Least to most</option>
              <option value="desc">Most to least</option>
            </select>
          </div>
          <div class="col-md-2">
            <button type="submit" class="btn btn-login">Search</button>
          </div>
        </div>
      </form>
      <!-- search and filter jobs end -->

      <div class="bg-white p-4 rounded">
        <h4 class="text-dark">Your Posted Jobs</h4>
        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">Job Title</th>
              <th scope="col">Applicants</th>
              <th scope="col">Status</th>
              <th scope="col">Action</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">Software Engineer</th>
              <td>5</td>
              <td>Inactive</td>
              <td>
                <a href="#" class="btn btn-sm btn-primary">view</a>
                <a href="#" class="btn btn-sm btn-warning"
                  >Deactivate/Activate</a
                >
              </td>
            </tr>
            <tr>
              <th scope="row">Java Developer</th>
              <td>1</td>
              <td>Active</td>
              <td>
                <a href="#" class="btn btn-sm btn-primary">view</a>
                <a href="#" class="btn btn-sm btn-warning"
                  >Deactivate/Activate</a
                >
              </td>
            </tr>
            <tr>
              <th scope="row">PHP Developer</th>
              <td>2</td>
              <td>Active</td>
              <td>
                <a href="#" class="btn btn-sm btn-primary">view</a>
                <a href="#" class="btn btn-sm btn-warning"
                  >Deactivate/Activate</a
                >
              </td>
            </tr>
            <tr>
              <td colspan="4" class="text-center text-warning">No jobs post</td>
            </tr>
          </tbody>
        </table>
      </div>
    </main>

<%@ include file="includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>