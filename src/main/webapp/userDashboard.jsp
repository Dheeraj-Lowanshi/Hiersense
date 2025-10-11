<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="includes/header.jsp" %>

 <main class="container py-5">
      <h2 class="mb-4">Welcome, Dheeraj Lowanshi 👋</h2>

      <!--filter code start here-->
      <form action="#">
        <div class="row g-3 mb-4">
          <div class="col-md-3">
            <input
              type="text"
              name="search"
              class="form-control"
              placeholder="search by title or company"
            />
          </div>

          <div class="col-md-2">
            <input
              type="text"
              name="location"
              class="form-control"
              placeholder="location"
            />
          </div>

          <div class="col-md-2">
            <select name="experience" class="form-select">
              <option value="" selected disabled>Experience</option>
              <option value="fresher">Fresher</option>
              <option value="0-1">0-1 years</option>
              <option value="1-3">1-3 years</option>
              <option value="3-5">3-5 years</option>
              <option value="5+">5+ years</option>
            </select>
          </div>

          <div class="col-md-2">
            <select name="packaageLpa" class="form-select">
              <option value="" selected disabled>Package (LPA)</option>
              <option value="0-3">0-3 LPA</option>
              <option value="3-6">3-6 LPA</option>
              <option value="6-10">6-10 LPA</option>
              <option value="10+">10+ LPA</option>
              <option value="not-disclosed">Not disclosed</option>
            </select>
          </div>

          <div class="col-md-2">
            <select name="sort" class="form-select">
              <option value="" selected disabled>Sort</option>
              <option value="fewest">Fewest</option>
              <option value="most">Most</option>
            </select>
          </div>

          <div class="col-md-1">
            <button type="submit" class="btn btn-primary">Go</button>
          </div>
        </div>
      </form>
      <!--filter code ends here-->

      <!--job card start-->
      <div class="col-md-4">
        <div class="card p-3 position-relative">
          <span class="position-absolute top-0 end-0 px-2 py-1 small">
            2 sep
          </span>
          <div class="card-body">
            <h5 class="mb-1">Software developer</h5>
            <p class="mb-1 text-muted">A2infotech Pvt Ltd</p>
            <div class="d-flex flex-wrap text-muted small mb-2 gap-3">
              <div><i class="bi bi-briefcase-fill me-1"></i>3-5 years</div>
              <div><i class="bi bi-currency-dollar me-1"></i>6-10 LPA</div>
              <div><i class="bi bi-geo-alt-fill me-1"></i>Noida, India</div>
              <div><i class="bi bi-people-fill me-1"> 5 Openings</i></div>
            </div>
            <span class="badge bg-success">Applied</span>
            <button
              type="button"
              class="btn btn-outline-primary btn-sm mt-2"
              data-bs-toggle="modal"
              data-bs-target="#uploadresume"
            >
              Apply Now
            </button>
            <button
              type="button"
              class="btn btn-outline-secondary btn-sm mt-2"
              data-bs-toggle="modal"
              data-bs-target="#jobDetails"
            >
              View Details <i class="bi bi-arrow-right"></i>
            </button>
          </div>
          <div
            class="position-absolute bottom-0 m-2 bg-primary rounded-pill end-0 px-2 py-1 small"
          >
            30% match
          </div>
        </div>
      </div>
      <!--job card end-->

      <!-- upload resume popup start -->
      <div class="modal fade" id="uploadresume">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <form
            action="#"
            method="post"
            class="modal-content bg-dark text-white"
          >
            <div class="modal-header">
              <h5>Upload Resume</h5>
              <button
                type="button"
                class="btn btn-close btn-close-white"
                data-bs-dismiss="modal"
              ></button>
            </div>
            <div class="modal-body">
              <input type="hidden" name="jobId" id="modalJobId" />
              <input type="hidden" name="skills" id="modalSkills" />
              <label for="resumeFile" class="form-label">Upload Resume</label>
              <input
                type="file"
                name="resume"
                id="resumeFile"
                class="form-control"
                accept=".pdf"
                required
              />
            </div>
            <div class="modal-footer justify-content-between">
              <button type="submit" class="btn btn-success">
                Submit Resume
              </button>
              <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                Close
              </button>
            </div>
          </form>
        </div>
      </div>
      <!-- upload resume popup end -->

      <!-- view details popup start -->
      <div class="modal fade" id="jobDetails">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <form action="#" method="post" class="modal-content bg-white">
            <div class="modal-header">
              <h5 class="fw-bold" id="modalJobTitle">Software developer</h5>
              <button
                type="button"
                class="btn btn-close"
                data-bs-dismiss="modal"
              ></button>
            </div>
            <div class="modal-body">
              <p>
                <strong>Company :</strong
                ><span id="modalCompany">A2infotech Pvt Ltd</span>
              </p>
              <p>
                <strong>Location :</strong><span id="modalLocation">Delhi</span>
              </p>
              <p>
                <strong>Experience :</strong
                ><span id="modalExperience">2-3 years</span>
              </p>
              <p>
                <strong>Package :</strong><span id="modalPackage">3-4 LPA</span>
              </p>
              <p>
                <strong>Vacancies :</strong><span id="modalVacancies">6</span>
              </p>
              <p><strong>Skills :</strong><span id="modalSkills">Java</span></p>
              <p>
                <strong>Job Description :</strong
                ><span id="modalDescription">Lorem ipsum dolor sit amet.</span>
              </p>
              <p>
                <strong>Posted Date :</strong
                ><span id="modalPostedDate">05-Sep-2025</span>
              </p>
            </div>
          </form>
        </div>
      </div>
      <!-- view details popup end -->
    </main>

<%@ include file="includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>