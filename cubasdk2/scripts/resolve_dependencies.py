import os
import requests
import xml.etree.ElementTree as xml

jmix_version = os.getenv("JMIX_VERSION")
spring_boot_version = os.getenv("SPRING_BOOT_VERSION")

# link to Jmix BOM
jmix_bom_file_path = \
    "https://nexus.jmix.io/repository/public/io/jmix/bom/jmix-bom/{jmix_version}/jmix-bom-{jmix_version}.pom" \
        .format(jmix_version=jmix_version)

# link to Spring Boot BOM
spring_bom_file_path = \
    "https://repo1.maven.org/maven2/org/springframework/boot/spring-boot-dependencies/" \
    "{spring_boot_version}/spring-boot-dependencies-{spring_boot_version}.pom" \
        .format(spring_boot_version=spring_boot_version)

# used to collect all resolved dependencies
resolved_dependencies_file = os.getenv("CUBA_SDK_SCRIPTS_DIR") + "/resolved_dependencies"
tmp_bom_file = "tmp_bom.xml"

# paid Jmix add-ons should be excluded from artefacts list
jmix_paid_addons = [
    "io.jmix.bpm",
    "io.jmix.notifications",
    "io.jmix.businesscalendar",
    "io.jmix.maps",
    "io.jmix.webdav"]


def collect_jmix_dependencies():
    response = requests.get(jmix_bom_file_path)
    dependency_list = []
    with open(tmp_bom_file, "w") as file:
        file.write(response.text)
        dependencies = xml.parse(tmp_bom_file).getroot() \
            .find("{http://maven.apache.org/POM/4.0.0}dependencyManagement") \
            .find("{http://maven.apache.org/POM/4.0.0}dependencies") \
            .findall("{http://maven.apache.org/POM/4.0.0}dependency")

        for dependency in dependencies:
            group_id = dependency.find(".//{http://maven.apache.org/POM/4.0.0}groupId").text
            if group_id in jmix_paid_addons:
                continue
            artifact_id = dependency.find(".//{http://maven.apache.org/POM/4.0.0}artifactId").text
            version = dependency.find(".//{http://maven.apache.org/POM/4.0.0}version").text
            dependency_list.append(group_id + ":" + artifact_id + ":" + version)

    with open(resolved_dependencies_file, "a") as file:
        for dependency in dependency_list:
            file.write(dependency)
            file.write("\n")


def collect_spring_boot_dependencies():
    response = requests.get(spring_bom_file_path)
    dependency_list = []
    with open(tmp_bom_file, "w") as file:
        file.write(response.text)

        props = xml.parse(tmp_bom_file).getroot() \
            .find("{http://maven.apache.org/POM/4.0.0}properties")

        dependencies = xml.parse(tmp_bom_file).getroot() \
            .find("{http://maven.apache.org/POM/4.0.0}dependencyManagement") \
            .find("{http://maven.apache.org/POM/4.0.0}dependencies") \
            .findall("{http://maven.apache.org/POM/4.0.0}dependency")

        for dependency in dependencies:
            group_id = dependency.find(".//{http://maven.apache.org/POM/4.0.0}groupId").text
            artifact_id = dependency.find(".//{http://maven.apache.org/POM/4.0.0}artifactId").text
            version = dependency.find(".//{http://maven.apache.org/POM/4.0.0}version").text
            if version.startswith("${"):
                version_macro = version[2: len(version) - 1]
                version = props.find("{http://maven.apache.org/POM/4.0.0}" + version_macro).text
            dependency_list.append(group_id + ":" + artifact_id + ":" + version)

    with open(resolved_dependencies_file, "a") as file:
        for dependency in dependency_list:
            file.write(dependency)
            file.write("\n")


if __name__ == '__main__':
    collect_jmix_dependencies()
    collect_spring_boot_dependencies()
