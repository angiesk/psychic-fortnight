FROM node:14.6  
# layer of images,layer 1
WORKDIR /app
COPY package.json . 
#caches results, to optimise for working as if layer 3 changes steps from layer 3 to 5
RUN npm install
COPY . ./
# when code changes it doesnot re run npm run
ENV PORT 3000
EXPOSE $PORT
#change below after adding nodemon to CMD ["npm", "run","dev"]
#CMD ["node", "index.js"]
CMD ["node", "index.js"]

