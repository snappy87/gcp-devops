import os
from google.cloud import container_v1
from google.auth.exceptions import DefaultCredentialsError

def check_gcp_connection():
    project_id = os.environ.get("GOOGLE_CLOUD_PROJECT", "your-default-project-id")
    zone = "us-central1-a"
    
    print(f"Initializing GCP GKE Client for project: {project_id}...")
    
    try:
        client = container_v1.ClusterManagerClient()
        parent = f"projects/{project_id}/locations/{zone}"
        
        response = client.list_clusters(parent=parent)
        print("\nSuccessfully connected to GCP API!")
        print(f"Existing GKE Clusters in {zone}:")
        
        if not response.clusters:
            print(" - No clusters found (clean environment).")
        for cluster in response.clusters:
            print(f" - Cluster Name: {cluster.name} | Status: {cluster.status}")
            
    except DefaultCredentialsError:
        print("\n[ERROR]: GCP Credentials not found. Please run 'gcloud auth application-default login' first.")
    except Exception as e:
        print(f"\n[ERROR]: An error occurred: {e}")

if __name__ == "__main__":
    check_gcp_connection()