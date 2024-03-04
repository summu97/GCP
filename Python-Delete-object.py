NOTE:
1. Run cmnd: pip install google-cloud-storage

-----------------------------------------------------------------------

from google.cloud import storage

def delete_object(bucket_name, object_name):
    # Create a client to interact with Google Cloud Storage
    client = storage.Client()

    # Get the specified bucket
    bucket = client.get_bucket(bucket_name)

    # Get the specified object
    blob = bucket.blob(object_name)

    # Delete the object
    blob.delete()

    print("Object '{}' in bucket '{}' deleted successfully.".format(object_name, bucket_name))

# Replace 'your_bucket_name' with the actual name of the GCS bucket
# Replace 'your_object_name' with the name of the object you want to delete
delete_object('your_bucket_name', 'your_object_name')
