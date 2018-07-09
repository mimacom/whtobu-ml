import turicreate as tc
import os

# Load images (Note: you can ignore 'Not a JPEG file' errors)
data = tc.image_analysis.load_images('images', with_path=True)

# From the path-name, create a label column
data['label'] = data['path'].apply(lambda path: os.path.basename(os.path.dirname(path)))

# Save the data for future use
data.save('collection.sframe')
