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

<!-- Hero Section start -->
    <main class="flex-shrink-0">
      <div
        class="hero d-flex flex-column align-items-center justify-content-center text-center"
      >
        <h1>Get Hired Smarter with AI</h1>
        <p class="lead">Transform your career journey with intelligent tools</p>
        <a href="#" class="btn btn-cta mt-4 shadow">Get Started</a>
      </div>

      <!-- Features Section -->
      <div class="container py-5">
        <div class="row text-center g-4">
          <div class="col-md-4 d-flex">
            <div class="feature-card shadow-lg flex-fill">
              <h4>Smart Resume Builder</h4>
              <p>
                Create an optimized resume with AI-driven formatting and content
                suggestions that stand out to recruiters.
              </p>
            </div>
          </div>
          <div class="col-md-4 d-flex">
            <div class="feature-card shadow-lg flex-fill">
              <h4>Skill Gap Analyzer</h4>
              <p>
                Discover which skills you’re missing and get AI-recommended
                courses to accelerate your career growth.
              </p>
            </div>
          </div>
          <div class="col-md-4 d-flex">
            <div class="feature-card shadow-lg flex-fill">
              <h4>AI Career Coach</h4>
              <p>
                Receive personalized guidance, interview prep, and smart job
                matches tailored to your career goals.
              </p>
            </div>
          </div>
        </div>
      </div>
    </main>
    <!-- Hero Section End -->

<%@ include file="includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>