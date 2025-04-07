import { Droppable } from "@hello-pangea/dnd";

import Card from "./card";

const Column = ({ title, list }) => {
  return (
    <Droppable droppableId={title}>
      {(droppableProvided) => (
        <div
          ref={droppableProvided.innerRef}
          {...droppableProvided.droppableProps}
          className="flex w-72 flex-col items-start rounded-md bg-neutral-100"
        >
          <div className="flex w-full items-center gap-2 px-6 py-4">
            <span className="grow shrink-0 basis-0 text-body-bold font-body-bold text-default-font">
              {title}
            </span>
          </div>
          <div className="flex w-full flex-col items-start gap-4 px-6 pb-6 overflow-auto">
            {list.map((item, index) => {
              return <Card item={item} key={item.id} index={index} />;
            })}
            {droppableProvided.placeholder}
          </div>
        </div>
      )}
    </Droppable>
  );
};

export default Column;
