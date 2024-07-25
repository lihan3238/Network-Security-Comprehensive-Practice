import os
import re

# 修改这里的参数
markdown_file_path = '个人实验日志.md'
image_directory_path = '../img/DaleChu'

def find_and_remove_unused_images(markdown_file_path, image_directory_path):
    # 读取 markdown 文件内容
    with open(markdown_file_path, 'r', encoding='utf-8') as md_file:
        markdown_content = md_file.read()

    # 获取图片目录中的所有图片文件名
    image_files = os.listdir(image_directory_path)

    # 使用正则表达式查找 markdown 中的所有图片引用
    used_images = re.findall(r'!\[.*?\]\((.*?)\)', markdown_content)

    # 解析出图片文件名
    used_image_files = {os.path.basename(image) for image in used_images}

    # 找出未被使用的图片
    unused_images = [image for image in image_files if image not in used_image_files]

    # 打印并删除未使用的图片
    if unused_images:
        print("以下图片在 markdown 文件中未被引用，将被删除:")
        for image in unused_images:
            image_path = os.path.join(image_directory_path, image)
            os.remove(image_path)
            print(image)
    else:
        print("所有图片都在 markdown 文件中被引用。")

# 运行函数
find_and_remove_unused_images(markdown_file_path, image_directory_path)