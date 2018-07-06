import turicreate as tc

# Load the data
data =  tc.SFrame('images.sframe')

data['image_with_ground_truth'] = \
    tc.object_detector.util.draw_bounding_boxes(data['image'], data['annotations'])

data.explore()