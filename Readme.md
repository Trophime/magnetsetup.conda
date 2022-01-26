= Conda package

It may be needed to have a conda package.
You can create such a package from Dockerfile-conda image.
The recipe uses a tar gzipped archive from Lncmi debian repository.

```bash
sudo /opt/conda/bin/mamba install --quiet --yes 'boa'
sudo /opt/conda/bin/boa convert meta.yaml > recipe.yaml
sudo /opt/conda/bin/boa build .
sudo /opt/conda/bin/mamba install --quiet --yes magnettools --use-local
```

== Using `myconda` docker image

```bash
docker run -it --rm -v${LNCMI_CHANNEL}:/tmp/lncmi-conda/linux_64 myconda bash
```

In the container:

```bash
git clone https://github.com/Trophime/magnetgeo.conda
cd magnetgeo.cmake
sudo /opt/conda/bin/mamba install --quiet --yes 'boa'
sudo /opt/conda/bin/boa convert meta.yaml > recipe.yaml
sudo /opt/conda/bin/boa build .
```

To store the package into Lncmi channel:

```bash
sudo cp /opt/conda/conda-bld/linux-64/magnetgeo-0.1.0-hb0f4dca_0.tar.bz2 /tmp/lncmi-conda/linux_64
sudo /opt/conda/mamba index /tmp/lncmi-conda/linux_64
```

To install the package from Lncmi channel

```bash
sudo /opt/conda/bin/mamba install --quiet --yes magnettools file::/tmp/lncmi-conda/linux_64
```



= References

[Manba](https://boa-build.readthedocs.io/en/latest/recipe_spec.html#build-section)
[Conda](https://docs.conda.io/projects/conda-build/en/latest/index.html)
[Private Depot](https://stackoverflow.com/questions/35359147/how-can-i-host-my-own-private-conda-repository)