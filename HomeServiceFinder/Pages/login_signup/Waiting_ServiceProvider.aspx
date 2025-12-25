<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Waiting_ServiceProvider.aspx.cs" Inherits="HomeServiceFinder.Pages.login_signup.Waiting_ServiceProvider" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pending Approval | Home Service Finder</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        :root {
            --primary: #FDA12B;
            --secondary: #8D9297;
            --light: #F8F9FA;
            --dark: #182333;
        }

        body { 
            background-color: var(--light); 
            color: var(--dark);
            display: flex; 
            align-items: center; 
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .card { 
            border: none; 
            border-top: 5px solid var(--primary);
            border-radius: 12px; 
            box-shadow: 0 10px 30px rgba(24, 35, 51, 0.1); 
        }

        .status-icon { 
            color: var(--primary);
            font-size: 5rem;
            margin-bottom: 20px;
        }

        .btn-primary-custom {
            background-color: var(--primary);
            border-color: var(--primary);
            color: white;
            padding: 10px 25px;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn-primary-custom:hover {
            background-color: #e58f22;
            color: white;
            transform: translateY(-2px);
        }

        .text-secondary-custom {
            color: var(--secondary);
        }

        .admin-note {
            background-color: #fff9f2;
            border-left: 4px solid var(--primary);
            padding: 20px;
            border-radius: 4px;
        }

        .loader-dots span {
            width: 8px;
            height: 8px;
            background: var(--primary);
            border-radius: 50%;
            display: inline-block;
            animation: bounce 1.4s infinite ease-in-out both;
        }

        @keyframes bounce {
            0%, 80%, 100% { transform: scale(0); }
            40% { transform: scale(1.0); }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5 text-center">
                <div class="card p-4 p-md-5">
                    <div class="card-body">
                        <div class="status-icon">
                            <i class="bi bi-clock-history"></i>
                            ⏳
                        </div>
                        
                        <h2 class="fw-bold mb-3" style="color: var(--dark);">Application Pending</h2>
                        <p class="text-secondary-custom mb-4">
                            We’ve received your registration! Our admin team is currently reviewing your details to ensure the best quality for our customers.
                        </p>
                        
                        <div class="admin-note text-start mb-4">
                            <h6 class="fw-bold mb-2" style="color: var(--dark);">Next Steps:</h6>
                            <small class="d-block mb-1 text-muted">• Background verification check.</small>
                            <small class="d-block mb-1 text-muted">• Document validation (ID & Certifications).</small>
                            <small class="d-block text-muted">• Approval notification via email.</small>
                        </div>

                        <div class="loader-dots mb-4">
                            <span></span>
                            <span style="animation-delay: 0.2s"></span>
                            <span style="animation-delay: 0.4s"></span>
                        </div>
                    </div>
                </div>
                
                <p class="mt-4 small" style="color: var(--secondary);">
                    Need help? <a href="mailto:support@homeservicefinder.com" style="color: var(--primary); font-weight: 600;">Contact Admin Support</a>
                </p>
            </div>
        </div>
    </form>
</body>
</html>